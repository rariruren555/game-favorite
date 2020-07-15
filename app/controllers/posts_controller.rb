class PostsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash.now[:notice] = '投稿が完了しました'
    else
      redirect_to new_post_path, alert: '入力欄を全て入力してください。'
    end
  end

  private
  def post_params
    params.require(:post).permit(:game_name, :game_hard, :evaluation, :title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
