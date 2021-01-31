class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.where(hidden: false)

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

  def hidden
    @user = User.find(params[:id])
    @user.hidden = true
    # flash[:notice] = "#{@user.first_name} was successfully hidden."
    @user.save
    redirect_to users_path    
  end
  
  def destroy # we don't ever want to delete a user. how to hide a user?   
    @user = User.find(params[:id])
    @user.hidden = true
    flash[:notice] = "#{@user.first_name} was successfully hidden."
    redirect_to user_path    
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
