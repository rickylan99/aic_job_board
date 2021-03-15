class JobApplication < ApplicationRecord
    belongs_to :job
    has_and_belongs_to_many :documents
end
