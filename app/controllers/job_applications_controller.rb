# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  before_action :authorize
  before_action :receive_job

  def index
    @job_applications = @job.job_applications
  end

  def new
    @job_application = @job.job_applications.build

    @job_application.job_application_answers.build

    # @job_application.document.build
    @document = @job_application.application_documents.build
  end

  def create
    @job_application = @job.job_applications.build(application_params)

    cloud_output = Cloudinary::Uploader.upload(params[:application_documents][0], type: :private)
    doc = @job_application.application_documents.new(
      public_id: cloud_output['public_id'],
      file_name: cloud_output['original_filename'],
      documenttype: 'resume'
    )

    doc.save

    # if @job_application.save
    if doc.save
      flash[:notice] = 'Application Submitted Sucessfully!'
    else
      flash[:alert] = 'Failed to Submit Application'
    end

    redirect_to jobs_path
  end

  def show
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def edit; end

  def delete; end

  private

  def application_params
    params.require(:job_application).permit(:user_id, :answers,
                                            job_application_answers_attributes: %i[id job_application_id job_question_id answer])
  end

  def receive_job
    @job = Job.find(params[:job_id])
  end
end
