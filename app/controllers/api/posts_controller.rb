class Api::PostsController < ApplicationController
  # load_and_authorize_resource
  before_action :authorize_request

  # def index
  #   @posts = Post.all.order('created_at')
  #   render json: { success: true, data: { posts: @posts } }
  # end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).includes(:comments)

    json_response(@posts)
  end
end
