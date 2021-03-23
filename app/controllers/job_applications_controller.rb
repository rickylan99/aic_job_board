# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  before_action :authorize
  before_action :get_job

  def index
    @job_applications = @job.job_applications
  end

  def new
    @job_application = @job.job_applications.build

    @job_application.job_application_answers.build
  end

  def create
    @job_application = @job.job_applications.build(application_params)

    # put @job_application.to_s

    # redirect_to jobs_path

    # respond_to do |format|
    if @job_application.save
      flash.now.alert = 'Worked'
    else
      flash.now.alert = @job_application.errors
      # format.html { render :new }
      # format.json { render json: @job_application.errors, status: :unprocessable_entity }

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

  def get_job
    @job = Job.find(params[:job_id])
  end
end
