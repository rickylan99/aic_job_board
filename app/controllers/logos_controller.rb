# frozen_string_literal: true

class LogosController < ApplicationController
  def serve
    @logo = Logo.find(params[:id])
    send_data(@logo.file, type: @logo.mime_type, filename: @logo.filename,
                          disposition: 'inline')
  end

  def destroy
    @logo = Logo.find(params[:id])
    @logo.destroy
    redirect_to(logos_url)
  end
end
