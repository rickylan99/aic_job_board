class ExportController < ApplicationController
    def export_users
    end
    
    def export_job
        dir = File.dirname("#{Rails.root}/export/#{Time.now}_job")
        FileUtils.mkdir_p(dir) unless File.directory?(dir)

    end
end
