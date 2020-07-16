class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new(user_id: @current_user.id)
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash.now[:notice] = '投稿が完了しました'
    else
      redirect_to new_post_path, alert: '入力欄を全て入力してください。'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end


  private
  def post_params
    params.require(:post).permit(:game_name, :game_hard, :evaluation, :title, :text, :image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
