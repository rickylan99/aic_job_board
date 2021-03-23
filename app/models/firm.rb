class Firm < ApplicationRecord
    has_many :jobs, dependent: :destroy
end
