class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :comments, :through => :jobs
end
