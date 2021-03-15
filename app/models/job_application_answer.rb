class JobApplicationAnswer < ApplicationRecord
  belongs_to :job_application
  belongs_to :job_question
end
