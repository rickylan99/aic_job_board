class Job < ApplicationRecord
	belongs_to :firm
	belongs_to :user
	has_many :job_applications, dependent: :destroy
	has_many :job_questions, dependent: :destroy 
	accepts_nested_attributes_for :job_questions, allow_destroy: true, reject_if: :all_blank
end