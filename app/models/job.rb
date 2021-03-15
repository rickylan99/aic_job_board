class Job < ApplicationRecord
	belongs_to :firm
	belongs_to :user
	has_many :job_applications, dependent: :destroy
end