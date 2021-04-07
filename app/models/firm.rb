# frozen_string_literal: true

class Firm < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_one :image, dependent: :destroy 
end
