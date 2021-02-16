class SessionsController < ApplicationController

    # before_action :require_login
    # skip_before_action :require_login, only: [:new, :create]
  
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Please login or create an account."
            redirect_to login_path
        end
    end

    def logout 
        session.clear
        redirect_to root_path
    end 

    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user| 
            user.password = SecureRandom.hex(10)
            end 
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to users_path 
        else 
            redirect_to "/"
        end 
    end 

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end 

    def user_params
        params.require(:user).permit! #(:email, :password)
    end 
end 