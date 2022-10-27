class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(@user)
        else
          flash[:error] = 'Post not created'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
