class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post:)
    if like.save!
      flash[:success] = 'Post Liked successfully'
    else
      flash[:error] = 'Like not added'
    end
    redirect_to user_posts_path(current_user)
  end
end
