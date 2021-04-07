
class ImagesController < ApplicationController

  def serve
    @image = Image.find(params[:id])
    send_data(@image.file, :type => @image.mime_type, :filename => @image.filename, :disposition => "inline")
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to(images_url)
  end


end