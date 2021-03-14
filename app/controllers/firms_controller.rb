class FirmsController < ApplicationController
  before_action :authorize, only: [:index, :create, :show, :edit, :delete]
  
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

  private

  def firm_params
    params.require(:firm).permit(:name, :description, :location, :industry, :website, :linkedin)
  end
  
end