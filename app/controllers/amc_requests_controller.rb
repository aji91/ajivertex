class AmcRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_amc_request, only: [:edit, :update, :show]

  def index
  	@amc_requests = AmcRequest.all
    @q = params[:search]
    search_amc_requests if @q.present?
    @amc_requests = @amc_requests.page(params[:page]).per(20)
  end

  def search_amc_requests
    @amc_requests = @amc_requests.where("code LIKE ?", "%#{@q[:name]}%")
  end

  def new
    @amc_request = AmcRequest.new
  end

  def create
    @amc_request = AmcRequest.new(amc_request_params)
    if @amc_request.save
      flash[:notice] = 'AMC request successfully created.'
      redirect_to amc_requests_path
    else
      flash[:error] = @amc_request.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @amc_request.update_attributes(amc_request_params)
      flash[:notice] = 'AMC request successfully updated.'
      redirect_to amc_requests_path
    else
      flash[:error] = @amc_request.errors.full_messages[0]
      render :edit
    end
  end

  def download_report
    @amc_requests = AmcRequest.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=AMCrequests-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_amc_request
    @amc_request = AmcRequest.find_by_id(params[:id])
    unless @amc_request
      flash[:error] = "AMC request not found."
      redirect_to amc_requests_path
    end
  end

  def amc_request_params
    params.require(:amc_request).permit(
      :code, :request_date, :request_type, :amount, :before_image, :client_id,
      :contact_no, :address1, :address2, :city, :country_id, :state_id,
      :pincode, :status, :pin, :assigned_to, :assigned_on
    )
  end

end