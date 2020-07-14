class PostsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:game_name, :game_hard, :evaluation, :title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
