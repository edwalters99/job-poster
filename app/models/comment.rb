class Comment < ApplicationRecord
    validates :comment, :presence => true
    belongs_to :job, :optional => true
    belongs_to :user, :optional => true
end
