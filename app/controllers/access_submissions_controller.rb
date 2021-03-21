class AccessSubmissionsController < ApplicationController
  def index
    @access_submission = AccessSubmission.all
  end

  def new
    @access_submission = AccessSubmission.new
  end

  def create
    @access_submission = AccessSubmission.create(access_submission_params)
    redirect_to root_path
  end

  def show

  end
  private
  def access_submission_params
    params.require(:access_submission).permit(:email, :first_name, :last_name)
  end
end
