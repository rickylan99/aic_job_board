class JobApplicationAnswer < ApplicationRecord
  belongs_to :job_application, optional: true
  belongs_to :job_question
end
