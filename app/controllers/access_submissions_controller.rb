class AccessSubmissionsController < ApplicationController
  def index
    @access_submission = AccessSubmission.all
  end

  def new
    @access_submission = AccessSubmission.new
    @tempfile = Tempfile.new {}
  end

  def create
    @access_submission = AccessSubmission.new(access_submission_params)

    cloud_output = Cloudinary::Uploader.upload(@tempfile, :type => :private)
    @access_submission.public_id = cloud_output["public_id"]
    @access_submission.file_name = cloud_output["original_filename"]
    
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

  private
  def access_submission_params
    params.require(:access_submission).permit(:email, :first_name, :last_name,:classification,:phone_number,:q1,:q2,:q3,:q4)
  end
end
