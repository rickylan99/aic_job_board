class JobsController < ApplicationController
  before_action :authorize, only: [:index, :create, :show, :edit, :delete]

  def index
    @job = Job.all
  end
  def new
    @job = Job.new
  end
  def create
    #this will need some sort of authentication to make it admin only, right now I am just creating the page
    #@job = Job.create(params.require(:))
  end

  def show
  end

  def edit
  end

  def delete
  end

  def job_params
    params.require(:job).permit(:company, :description)
  end
end
