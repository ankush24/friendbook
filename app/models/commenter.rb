class Commenter < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  validates :comments, presence: true
end
