class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  # validates :comments, presence: true, length: { maximum: 100}
  validate  :picture_size
  has_many :voter_relationships
  has_many :commenters

  def is_like?(current_user)
    like = VoterRelationship.where(micropost_id: self.id, user_id: current_user.id).first
    if like.nil?
      true
    else
      false
    end
  end

  def number_of_likes
    nl = VoterRelationship.where(micropost_id: self.id, islike: true)
    nl.count
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end