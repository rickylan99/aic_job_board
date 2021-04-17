class ExportUsersJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    export = Export.find_by(user_id: user_id)

    dir_name = "tmp/export/#{Time.now.to_i}_users"
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

    index = 1
    User.all.each do |user|
      unless user.documents.empty?
        doc = user.documents[0]
        Dir.chdir(dir_name) do
          File.open("#{user.first_name}_#{user.last_name}_Resume_#{index}.pdf", 'wb') do |file|
            url = Cloudinary::Utils.private_download_url doc.public_id, :pdf, attachment: false
            file.write open(url).read
          end
        end
      end
      index += 1
      export.progress = index - 1
      export.save
    end

    @zipfile_name = "#{dir_name}/User Export - #{Time.zone.now.strftime('%B %d, %Y')}.zip"
    Zip::File.open(@zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir.foreach(dir_name) do |filename|
        zipfile.add(filename, File.join(dir_name, filename))
      end
    end
    
    export.file_location = @zipfile_name
    export.save

  end
end
