class JobsController < ApplicationController
  before_action :authorize
  
  #TODO: Refactor controller so that we do not look up job so many times, https://medium.com/@nancydo7/ruby-on-rails-crud-tutorial-899117710c7a

  def index
    @job = Job.all
  end

  def new
    @job = Job.new

    @job.job_questions.build
  end
  
  def create
    #this will need some sort of authentication to make it admin only, right now I am just creating the page
    #@job = Job.create(params.require(:))

    job = Job.create(job_params)

    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
    @questions = @job.job_questions
  end

  def edit
    @job = Job.find(params[:id])

    @job.job_questions.build
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)

    redirect_to job_path(@job)
  end


  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:user_id, :firm_id, :title, :position, :location, :description, :classifications, :deadline, job_questions_attributes: [:id, :_destroy, :job_id, :question])
  end
  
end
