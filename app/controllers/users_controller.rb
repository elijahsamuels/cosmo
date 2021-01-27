class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.find_or_create_by(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy # we don't ever want to delete a user. how to hide a user?   
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
