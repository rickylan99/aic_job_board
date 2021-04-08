# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :authorize, :admin_only

  def index
  end
  
  def users_panel
    @user = User.all
    @access_submission = AccessSubmission.all
  end

  def jobs_panel
    @job = Job.all
  end

  def firms_panel
    @firms = Firm.all
  end

  def firm_view
    @firm = Firm.find(params[:id])

    @jobs = @firm.jobs
  end
end
