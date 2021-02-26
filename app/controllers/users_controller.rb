class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :current_user
  before_action :admin_access, except: [:new, :create, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # # if @current_user.admin?
    #   if @user.save
    #     # session[:user_id] = @user.id
    #     redirect_to user_path
    #   else
    #     @error = @user.errors.full_messages
    #     render new_user_path
    #   end 
    # else
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = @user.errors.full_messages
        render new_user_path
      end 
  end
  
  def index
    @users = User.where(hidden: false)
  end
  
  def show
    find_user_by_id
    # @user_clients_list
  end

  def edit
    find_user_by_id
  end
  
  def update
    find_user_by_id
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    find_user_by_id
    byebug
    @user.delete
    flash[:notice] = "#{@user.first_name} is really gone!"
    redirect_to users_path    
  end
  
  def hidden
    find_user_by_id
    @user.hidden = true
    flash[:notice] = "#{@user.first_name} was successfully hidden."
    @user.save
    redirect_to users_path    
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!")  
    else
      @parameter = params[:search].downcase  
      @users = User.all.where("lower(first_name) LIKE :search", search: @parameter)
      render "index"
    end
  end

  private

  def user_params
    byebug
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password, :address_1, :address_2, :city, :state, :zip, :ssn, :admin, :client, :contractor, :admin_id, :client_id, :contractor_id,)
  end    

  def find_user_by_id
    @user = User.find_by(id: params[:id])
  end

end
