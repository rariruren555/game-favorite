class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new(user_id: @current_user.id)
    
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash.now[:notice] = '投稿が完了しました'
    else
      flash.now[:alert] = '入力欄を全て入力してください。'
      render :new
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
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
    if user_signed_in?
      @current_like = @post.likes.where(user_id: current_user.id).first
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:game_name, :game_hard, :evaluation, :title, :text, :image, :user_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
