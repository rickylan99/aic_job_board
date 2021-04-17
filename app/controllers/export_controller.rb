# frozen_string_literal: true

class ExportController < ApplicationController
  require 'open-uri'
  require 'rubygems'
  require 'zip'
  require 'combine_pdf'

  def download_export
    send_file Export.find_by(user_id: current_user.id).file_location
  end

  def export_users
    if not Export.exists?(user_id: current_user.id)
      @export = Export.create(user_id: current_user.id)
    else
      @export = Export.find_by(user_id: current_user.id)
    end
    @export.assign_attributes(total_actions: User.all.count, progress: 0, file_location: "")
    @export.save

    gon.watch.export_progress = @export.progress
    gon.total_actions = @export.total_actions

    ExportUsersJob.perform_now current_user.id
  end

  def export_job
    dir_name = "tmp/export/#{Time.now.to_i}_job"
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

    job = Job.find(params[:id])
    questions = []

    job.job_questions.each do |q|
      questions << q.question
    end

    firm_name = Firm.find(job.firm_id).name
    job_apps = job.job_applications

    user_details = CombinePDF.new

    index = 1
    job_apps.each do |app|
      user = User.find(app.user_id)
      doc = app.application_documents[0]

      answers = []
      app.job_application_answers.each do |a|
        answers << a.answer
      end

      pdf_data = WickedPdf.new.pdf_from_string(pdf_string(user, questions, answers))
      user_details << CombinePDF.parse(pdf_data)

      Dir.chdir(dir_name) do
        File.open("#{user.first_name}_#{user.last_name}_Resume_#{index}.pdf", 'wb') do |file|
          url = Cloudinary::Utils.private_download_url doc.public_id, :pdf, attachment: false
          file.write open(url).read
        end
      end
      index += 1
    end

    Dir.chdir(dir_name) do
      user_details.save "_#{firm_name} - #{job.title} - Submissions.pdf"
    end

    @zipfile_name = "#{dir_name}/#{firm_name} - #{job.title}.zip"
    Zip.sort_entries = true
    Zip::File.open(@zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir.foreach(dir_name) do |filename|
        zipfile.add(filename, File.join(dir_name, filename))
      end
    end
    send_file @zipfile_name
  end

  private

  def pdf_string(user, questions, answers)
    heading = "<head><style>body {font-family: Tahoma, sans-serif;}</style></head> \n" \
              "<h1 style=\"text-align: center;\"> #{user.first_name} #{user.last_name}</h1> <br>\n" \
              "<h2>Classification: #{user.classification}</h2> \n" \
              "<h2>Major: #{user.major}</h2> <br>\n" \
              "<h3>Questions: </h3>\n"

    body = ''

    index = 1
    questions.zip(answers).each do |q, a|
      body += "<p><strong> #{index}. #{q} </strong></p> \n <p> #{a} </p> <br>\n"
      index += 1
    end

    heading + body
  end
end
