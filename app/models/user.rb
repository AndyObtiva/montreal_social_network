class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one :feed
  has_many :my_follows, class_name: :Follow, foreign_key: :follower_user_id
  has_many :followed_users, through: :my_follows
  alias followed followed_users
  has_many :others_follows, class_name: :Follow, foreign_key: :followed_user_id
  has_many :follower_users, through: :others_follows
  alias followers follower_users
                   
  after_commit :create_feed!, on: :create
  
  def follow(other_user)
    followed << other_user unless followed.include?(other_user)
  end
end
