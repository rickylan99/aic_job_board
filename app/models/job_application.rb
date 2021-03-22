class JobApplication < ApplicationRecord
    belongs_to :job
    has_and_belongs_to_many :documents
    has_many :job_application_answers
    accepts_nested_attributes_for :job_application_answers
end
