class User < ApplicationRecord
    has_many :documents, :dependent => :destroy

    has_secure_password
    validates :email, presence: true, uniqueness: true
end
