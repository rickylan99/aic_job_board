class ExportController < ApplicationController
  require 'open-uri'
  require 'rubygems'
  require 'zip'

  def export_users
    dir_name = "tmp/export/#{Time.now.to_i}_users"
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

    User.all.each do |user|

      if not user.documents.empty?
        doc = user.documents[0]
        Dir.chdir(dir_name) do
          File.open("#{user.first_name}_#{user.last_name}_Resume_#{user.id}.pdf", "wb") do |file|
            url = Cloudinary::Utils.private_download_url doc.public_id, :pdf, attachment: false
            puts url
            file.write open(url).read
          end
        end
      end
      
    end

    @zipfile_name = "#{dir_name}/User Export - #{Time.now.strftime('%B %d, %Y')}.zip"
    Zip::File.open(@zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir.foreach(dir_name) do |filename|
        zipfile.add(filename, File.join(dir_name, filename))
      end
    end

    send_file @zipfile_name
    
  end

  def export_job
    dir_name = "tmp/export/#{Time.now.to_i}_job"
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

    job = Job.find(params[:id])
    firm_name = Firm.find(job.firm_id).name
    job_apps = job.job_applications

    job_apps.each do |app|

      user = User.find(app.user_id)
      puts "----------------------------------"
      puts "User:"
      puts user
      doc = app.application_documents[0]

      Dir.chdir(dir_name) do
        File.open("#{user.first_name}_#{user.last_name}_Resume_#{user.id}.pdf", "wb") do |file|
          url = Cloudinary::Utils.private_download_url doc.public_id, :pdf, attachment: false
          puts url
          file.write open(url).read
        end
      end

    end

    @zipfile_name = "#{dir_name}/#{firm_name} - #{job.title}.zip"
    Zip::File.open(@zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir.foreach(dir_name) do |filename|
        zipfile.add(filename, File.join(dir_name, filename))
      end
    end
    send_file @zipfile_name
  end



end
