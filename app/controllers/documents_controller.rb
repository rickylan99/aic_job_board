class DocumentsController < ApplicationController
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Document has been deleted' } 
      format.json { head :no_content }
      format.js   { render layout: false}
    end
  end
end
