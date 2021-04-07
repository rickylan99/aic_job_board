# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :job_applications
end
