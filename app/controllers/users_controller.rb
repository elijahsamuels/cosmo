class UsersController < ApplicationController

  before_action :require_login
  before_action :admin_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @current_user.admin?
      if @user.save
        # session[:user_id] = @user.id
        binding.pry
        redirect_to user_path
      else
        @error = @user.errors.full_messages
        binding.pry
        render new_user_path
      end 
    else
      if @user.save
        session[:user_id] = @user.id
        binding.pry
        redirect_to user_path(@user)
      else
        @error = @user.errors.full_messages
        binding.pry
        render new_user_path
      end 
    end
  end

  def index
    @users = User.where(hidden: false)
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
    @user.delete
    flash[:notice] = "#{@user.first_name} is really destroyed!"
    redirect_to users_path    
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
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password, :address_1, :address_2, :city, :state, :zip, :ssn, :admin, :client, :contractor, :admin_id, :client_id, :contractor_id,)
  end


end
