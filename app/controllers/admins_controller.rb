# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :authorize, :admin_only

  def index
  end

  def users_panel
    @user = User.all
    @access_submission = AccessSubmission.all

    @prefs = []
    @prefs << ['Investment Banking', User.count(&:investment_banking?)]
    @prefs << ['Private Equity', User.count(&:private_equity?)]
    @prefs << ['Venture Capital', User.count(&:venture_capital?)]
    @prefs << ['Real Estate', User.count(&:real_estate?)]
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

  def job_view
    @job = Job.find(params[:id])
    @questions = @job.job_questions
  end
end
