class AccessSubmission < ApplicationRecord
    belongs_to :access_application 
    belongs_to :user
end
