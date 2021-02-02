class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.where(hidden: false)
    # @users = User.all 
  end
  
  def create
    @user = User.find_or_create_by(user_params)
    redirect_to user_path(@user)
  end
  
  def show
    @user = User.find(params[:id])
    @user_clients_list
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.hidden = true
    flash[:notice] = "#{@user.first_name} was successfully hidden."
    redirect_to user_path    
  end
  
  def hidden
    @user = User.find(params[:id])
    @user.hidden = true
    # flash[:notice] = "#{@user.first_name} was successfully hidden."
    @user.save
    redirect_to users_path    
  end


  def self.user_clients_list
    c = User.find_by_id(params[:id]).clients
    c.each.collect do |a| a.first_name end
      end

  private

  def user_params
    params.require(:user).permit(:first_name.downcase, :last_name.downcase, :phone, :email.downcase, :address_1, :address_2, :city, :state, :zip, :ssn, :admin, :client, :contractor)
  end


end
