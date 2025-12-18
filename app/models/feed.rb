class Feed < ApplicationRecord
  belongs_to :user
  has_many :posts
  
  def followed_posts
    followed_users = user.followed
    followed_feeds = Feed.where(user: followed_users)
    Post.where(feed: followed_feeds)
  end
end
