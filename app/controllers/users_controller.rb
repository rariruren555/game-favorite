class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
    @user = user.id
  end
end
