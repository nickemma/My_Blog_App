class Post < ApplicationRecord
 belongs_to :user
 has_many :comments
 has_many :likes

  def after_save :update_post_counter
    user.increment!(:posts_count)
  end

 def recent_five_comments
    comments.last(5)
  end
end
