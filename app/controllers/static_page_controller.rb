# frozen_string_literal: true

class StaticPageController < ApplicationController
  def about; end

  def resources
    @resources = MemberResource.all
  end

  def download
    send_file(Rails.root.join('app' , 'assets', 'images', 'AIC_Resume_Template.docx'))
  end

end
