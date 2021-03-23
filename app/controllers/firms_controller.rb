class FirmsController < ApplicationController
  before_action :authorize, only: [:create, :edit, :delete]
  before_action :admin_only, only: [:new, :create, :edit]
  
  #TODO: Refactor controller so that we do not look up job so many times, https://medium.com/@nancydo7/ruby-on-rails-crud-tutorial-899117710c7a

  def index
    @firms = Firm.all
  end

  def new
    @firm = Firm.new
  end
  
  def create
    firm = Firm.create(firm_params)

    redirect_to firms_path
  end

  def show
    @firm = Firm.find(params[:id])

    @jobs = @firm.jobs
  end

  def edit
    @firm = Firm.find(params[:id])
  end

  def update
    @firm = Firm.find(params[:id])

    @firm.update(firm_params)

    redirect_to firm_path(@firm)
  end


  def destroy
    @firm = Firm.find(params[:id])
    @firm.destroy

    redirect_to firms_path
  end

  def jobs
    @firm = Firm.find(params[:id])

    @jobs = @firm.jobs
  end

  def new_job
    @firm = Firm.find(params[:id])

    @job = Job.new

    @job.job_questions.build
  end

  def create_job
    #this will need some sort of authentication to make it admin only, right now I am just creating the page
    #@job = Job.create(params.require(:))

    job = Job.create(job_params)

    redirect_to jobs_firm_path(job.firm_id)
  end

  private

  def firm_params
    params.require(:firm).permit(:name, :description, :location, :industry, :website, :linkedin)
  end

  def job_params
    params.require(:job).permit(:user_id, :firm_id, :title, :position, :location, :description, :classifications, :deadline, job_questions_attributes: [:id, :_destroy, :job_id, :question])
  end
  
end