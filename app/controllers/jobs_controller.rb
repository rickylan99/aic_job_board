class JobsController < ApplicationController
  before_action :authorize, only: [:index, :create, :show, :edit, :delete]
  
  #TODO: Refactor controller so that we do not look up job so many times, https://medium.com/@nancydo7/ruby-on-rails-crud-tutorial-899117710c7a

  def index
    @job = Job.all
  end

  def new
    @job = Job.new
  end
  
  def create
    #this will need some sort of authentication to make it admin only, right now I am just creating the page
    #@job = Job.create(params.require(:))

    dog = Job.create(job_params)

    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
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

  def job_params
    params.require(:job).permit(:userid, :company, :description)
  end
end
