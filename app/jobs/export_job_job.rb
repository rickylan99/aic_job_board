# frozen_string_literal: true

class ExportJobJob
  include SuckerPunch::Job

  def perform(user_id, job_id)
    dir_name = "tmp/export/#{Time.now.to_i}_job"
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

    ActiveRecord::Base.connection_pool.with_connection do
      job = Job.find(job_id)
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
            file.write URI.open(url).read
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

      export = Export.find_by(user_id: user_id)
      export.update(file_location: @zipfile_name)
    end
  end

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
