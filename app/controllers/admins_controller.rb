class AdminsController < ApplicationController
  before_action :authorize, :admin_only

  def index
  	@user = User.all
  	@access_submission = AccessSubmission.all
  end
end
