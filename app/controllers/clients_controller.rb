class ClientsController < ApplicationController

  before_action :require_login
  before_action :admin_access

  # new_user_client_path
  def new
    @client = User.new
  end
  
  def create
    @client = User.find_or_create_by(id: @client)
    binding.pry
    redirect_to client_path(@client)
  end

  def index
    if params[:user_id].present?
      @clients = User.find_by_id(current_user).clients
      @jobs = User.find_by_id(current_user).job_users
      # redirect_to user_clients_path(current_user)

    elsif !params[:user_id].present?
      @clients = User.all
    end
  end

  def show
    @client = User.find_by_id(params[:id])
  end

  def edit
    @client = User.find_by_id(params[:id])
    render "edit"
  end
  
  def update
    # datetime_for_job_start
    @client = User.find(params[:id])
    @client.update(client_params)
    redirect_to edit_client_path(@client)
  end

  def destroy # we don't ever want to delete a client. how to hide a client?   
  end
  
  private


  def client_params
    params.require(:client).permit! #(:first_name.downcase, :last_name.downcase, :email.downcase,
  end

end
