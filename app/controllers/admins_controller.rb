class AdminsController < ApplicationController
  
  def new
    @admin = Admin.new
  end

  # filters the views of all the clients or just the admin's clients
  def index
    current_user
    if params[:user_id].present?
      @clients = User.find_by_id(current_user).clients
      @jobs = User.find_by_id(current_user).invoices
    else
      @clients = User.all
    end
  end

  def create
    @admin = Admin.find_or_create_by(admin_params)
    redirect_to admin_path(@admin)
  end

  # def show
  #   find_admin_by_id
  # end

  def edit
    find_admin_by_id
  end
  
  def update
    find_admin_by_id
    @admin.update(admin_params)
    redirect_to edit_admin_path(@admin)
  end

  def destroy # we don't ever want to delete a Admin. how to hide a admin?   
    find_admin_by_id
    @admin.hidden = true
    flash[:notice] = "#{@admin.first_name} was successfully hidden."
    redirect_to admin_url    
  end

  private

    def admin_params
      params.require(:admin).permit!
    end

    def find_admin_by_id
      @admin = Admin.find_by(params[:id])
    end

end

