class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Compare this snippet from app\models\post.rb:
  def recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
