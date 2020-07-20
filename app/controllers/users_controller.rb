class UsersController < ApplicationController

  def index
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(50).pluck(:post_id))
    @ranks = Like.count
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
    @user = user.id
  end

  def likes
    redirect_to root_path unless user_signed_in?
  end

end
