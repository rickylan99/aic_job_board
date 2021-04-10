class ExportController < ApplicationController
  require 'open-uri'

  def export_users
  end

  def export_job
    dir_name = "tmp/export/#{Time.now.to_i}_job"

    dir = File.dirname(dir_name)
    FileUtils.mkdir(dir) unless File.directory?(dir)

    job = Job.find(params[:id])
    firm_name = Firm.find(job.firm_id).name
    job_apps = job.job_applications

    job_apps.each do |app|

      user = User.find(app.user_id)
      puts "----------------------------------"
      puts "User:"
      puts user
      doc = app.application_documents[0]

      Dir.chdir(dir) do
        File.open("#{user.first_name}_#{user.last_name}_Resume.pdf", "wb") do |file|
          url = Cloudinary::Utils.private_download_url doc.public_id, :pdf, attachment: false
          puts url
          file.write open(url).read
        end
      end

    end

    zipfile_name = "#{firm_name} - #{job.title}.zip"
    Dir.chdir(dir) do 
      Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
        Dir.foreach(dir) do |filename|
          zipfile.add(filename, File.join(dir, filename))
        end
      end
    end

    send_data zipfile_name
  end
end
