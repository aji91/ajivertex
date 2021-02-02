class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :update]

  def index
  	@clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = 'Client successfully created.'
      redirect_to clients_path
    else
      flash[:error] = @client.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update_attributes(client_params)
      flash[:notice] = 'Client successfully updated.'
      redirect_to clients_path
    else
      flash[:error] = @client.errors.full_messages[0]
      render :edit
    end
  end

  private

  def set_client
    @client = Client.find_by_id(params[:id])
    unless @client
      flash[:error] = "Client not found."
      redirect_to clients_path
    end
  end

  def client_params
    params.require(:client).permit(:name, :gstin, :email, :mobile, :land_line, :address_1, :address_2, :city, :country_id, :state_id, :pin_code, :account_no, :bank_name, :ifsc_no)
  end
end