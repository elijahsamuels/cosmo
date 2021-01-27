class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def index
    @clients = Client.all
    
  end

  def create
    @client = Client.find_or_create_by(client_params)
    redirect_to client_path(@client)
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to client_path(@client)
  end

  def destroy # we don't ever want to delete a client. how to hide a client?   
  end

  private

  def client_params
    params.require(:client).permit(:email)
  end

end
