# frozen_string_literal: true

class StaticPageController < ApplicationController
  def about; end

  def resources; end

  def download
    send_file(Rails.root.join('app' , 'assets', 'images', 'AIC_Resume_Template.docx'))
  end

end
