class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :update, :show]

  def index
  	@clients = Client.all
    @q = params[:search]
    search_clients if @q.present?
    @clients = @clients.page(params[:page]).per(20)
  end

  def search_clients
    @clients = @clients.where("name LIKE ?", "%#{@q[:name]}%")
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
  
  def show
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

  def download_report
    @clients = Client.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Clients-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
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