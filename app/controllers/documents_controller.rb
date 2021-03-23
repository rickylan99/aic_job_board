# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :authorize

  def destroy
    @document = Document.find(params[:id])
    Cloudinary::Uploader.destroy(@document.public_id, type: 'private', invalidate: true)
    @document.destroy
    redirect_to edit_user_path
  end
end
