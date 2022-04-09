class User < ApplicationRecord
    validates :first_name, :presence => true
    validates :email, :presence => true, :uniqueness => true
    has_secure_password
    has_many :jobs
    has_many :comments
end