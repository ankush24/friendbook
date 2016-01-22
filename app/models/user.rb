class User < ActiveRecord::Base
  # has_one :role
  belongs_to :role
  has_many :microposts, dependent: :destroy
  has_many :from_friendships, :foreign_key => :from_id, class_name: 'Friendship'
  has_many :to_friendships, :foreign_key => :to_id, class_name: 'Friendship'
  has_many :users, through: :friendships
  has_many :voter_relationships
  has_many :commenters
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def is_friend?(friend_id)
    friend = Friendship.where(to_id: friend_id, from_id: self.id, accepted: true).first
    # friend1 = Friendship.where(to_id: self.id, from_id: friend_id, accepted: true).first
    if friend.nil?
      false
    else
      true
    end
  end

  def is_other_user_friend?(friend_id)
    # friend = Friendship.where(to_id: friend_id, from_id: self.id, accepted: true).first
    friend = Friendship.where(to_id: self.id, from_id: friend_id, accepted: true).first
    if friend.nil?  #|| friend1.nil?
      false
    else
      true
    end
  end

  def is_pending_request?(friend_id)
    friend = Friendship.where(to_id: friend_id, from_id: self.id, accepted: false).first
    if friend.nil?
      false
    else
      true
    end
  end
  
  # def get_friends
  #   friends = []
  #   self.from_friendships.each do |from_friend|
  #     friends << from_friend.from_user
  #   end

  #   self.to_friendships.each do |to_friend|
  #     friends << to_friend.to_user
  #   end

  #   # from_friends = Friendship.where(from_id: self.id)
  #   # from_friends.each do |from_friend|
  #   #   friends << from_friend.from_user
  #   # end
  #   friends
  # end

end