class User < ApplicationRecord
 has_many :post
 has_many :comments, through: :posts
 has_many :likes, through: :posts

# Compare this snippet from app\models\post.rb:
def recent_three_post
 posts.last(3)
end

end
