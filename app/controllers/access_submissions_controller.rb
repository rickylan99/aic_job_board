class AccessSubmissionsController < ApplicationController
  before_action :authorize, :admin_only, except: [:new, :create]

  def index
    @access_submission = AccessSubmission.all
  end

  def new
    @access_submission = AccessSubmission.new
  end

  def create
    @access_submission = AccessSubmission.new(access_submission_params)

    cloud_output = Cloudinary::Uploader.upload(params[:documents][0], :type => :private)
    @access_submission.public_id = cloud_output["public_id"]
    @access_submission.file_name = cloud_output["original_filename"]
    @access_submission.documenttype = 'resume'
    
    if @access_submission.save 
      flash[:notice] = "Application Submitted Sucessfully!"
    else
      flash[:alert] = "Failed to Submit Application"
    end

    redirect_to root_path
  end

  def show
    @access_submission = AccessSubmission.find(params[:id])
  end

  def destroy
    @access_submission = AccessSubmission.find(params[:id])
    @access_submission.destroy
    redirect_to root_path
  end

  private
  def access_submission_params
    params.require(:access_submission).permit(:email, :first_name, :last_name,:classification,:phone_number,:q1,:q2,:q3,:q4)
  end
end
