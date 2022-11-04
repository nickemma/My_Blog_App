class API::CommentsController < ApplicationController

 before_action :authorize_request

 def index
  @user = User.find(params[:user_id])
  @posts = @user.posts.find(params[:post_id])
  json_response(@posts.comments)
 end

 def create
  @user = User.find(params[:user_id])
  comment = Comment.new(comment_params)
  comment.post = @user.posts.find(params[:post_id])
  comment.user = @user
  comment.save
  json_response(comment, :created)
 end

 private

 def comment_params
  params.permit(:text)
 end

end