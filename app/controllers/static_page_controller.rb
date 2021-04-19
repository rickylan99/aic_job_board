# frozen_string_literal: true

class StaticPageController < ApplicationController
  def about; end

  def resources
    @resources = MemberResource.all
  end
end
