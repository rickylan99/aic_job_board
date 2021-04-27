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
    @export = if !Export.exists?(user_id: current_user.id)
                Export.create(user_id: current_user.id)
              else
                Export.find_by(user_id: current_user.id)
              end
    @export.assign_attributes(total_actions: User.all.count, progress: 0, file_location: '')
    @export.save

    ExportUsersJob.perform_async(current_user.id)
  end

  def export_job
    @export = if !Export.exists?(user_id: current_user.id)
                Export.create(user_id: current_user.id)
              else
                Export.find_by(user_id: current_user.id)
              end
    @export.assign_attributes(total_actions: Job.find(params[:id]).job_applications.count, progress: 0, file_location: '')
    @export.save

    ExportJobJob.perform_async(current_user.id, params[:id])
  end
end
