class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def index
    @admins = Admin.all
  end

  def create
    @admin = Admin.find_or_create_by(admin_params)
    redirect_to admin_path(@admin)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admin_path(@admin)
  end

  def destroy # we don't ever want to delete a Admin. how to hide a admin?   
  end

  private

  def admin_params
    params.require(:admin).permit!
  end

end

