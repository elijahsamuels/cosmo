class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def index
    @clients = Client.all
    # @find_clients = Client.search(params[:query])
    # render 'index'

  end

  def create
    @client = Client.find_or_create_by(client_params)
    redirect_to client_path(@client)
  end

  # no show page needed

  def edit
    @client = Client.find(params[:id])
    render "edit"
  end
  
  def update
    # datetime_for_job_start
    @client = Client.find(params[:id])
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
