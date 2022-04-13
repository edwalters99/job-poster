class Job < ApplicationRecord
    validates :title, :presence => true
    validates :desc, :presence => true
    validates :price, :presence => true
    validates :categories, :presence => true
    belongs_to :user, :optional => true
    has_many :comments
    has_and_belongs_to_many :categories
end
