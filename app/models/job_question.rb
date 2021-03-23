# frozen_string_literal: true

class JobQuestion < ApplicationRecord
  belongs_to :job, optional: true
end
