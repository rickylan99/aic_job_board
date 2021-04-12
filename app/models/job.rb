# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :firm
  belongs_to :user
  has_many :job_applications, dependent: :destroy
  has_many :job_questions, dependent: :destroy
  accepts_nested_attributes_for :job_questions, allow_destroy: true, reject_if: :all_blank

  def expired_job
    # This sends an e-mail with a alerting an admin a job has expired
    JobMailer.expired_job(self).deliver_now
  end
end
