class User < ApplicationRecord
    has_many :documents, :dependent => :destroy
    accepts_nested_attributes_for :documents, allow_destroy: true

    has_secure_password
    validates :email, presence: true, uniqueness: true
end
