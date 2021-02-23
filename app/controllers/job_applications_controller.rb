class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def new
    #@job = Job.find(params[:id])
    @job_application = JobApplication.new
  end

  def create

    #application_params.jobid = params[:id]

    job_application_new = JobApplication.create(application_params)

    redirect_to_jobs_index_path
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end

  def edit
  end

  def delete
  end
end
