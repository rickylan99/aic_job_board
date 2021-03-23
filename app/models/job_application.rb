# frozen_string_literal: true

class JobApplication < ApplicationRecord
  belongs_to :job
  has_many :job_application_answers, dependent: :destroy
  accepts_nested_attributes_for :job_application_answers
end
