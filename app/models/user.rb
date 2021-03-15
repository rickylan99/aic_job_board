class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true

    belongs_to :role

    has_many :jobs
    has_many :job_applications
    has_many :documents
    has_one :access_submission
end
