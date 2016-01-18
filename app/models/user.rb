class User < ActiveRecord::Base
  # has_one :role
  belongs_to :role
  has_many :microposts, dependent: :destroy
  has_many :friendships
  has_many :users, through: :friendships 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  def feed
    Micropost.where("user_id = ?", id)
  end
end