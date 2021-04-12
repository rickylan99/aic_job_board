# frozen_string_literal: true

class AccessSubmission < ApplicationRecord
  # belongs_to :access_application
  # belongs_to :user

  def submission_new
    # This sends an e-mail with a alerting an admin a new access submission was recieved
    AccessSubmissionMailer.submission_new(self).deliver_now
  end
end
