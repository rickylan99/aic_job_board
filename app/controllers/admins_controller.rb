class AdminsController < ApplicationController
  before_action :authorize

  def index
  	@user = User.all
  	@access_submission = AccessSubmission.all
  end
end
