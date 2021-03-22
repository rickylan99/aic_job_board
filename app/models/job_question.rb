class JobQuestion < ApplicationRecord
  belongs_to :job, optional: true
end
