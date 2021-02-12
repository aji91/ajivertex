class ServiceRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_request, only: [:edit, :update, :show]

  def index
  	@service_requests = ServiceRequest.all
    @q = params[:search]
    search_service_requests if @q.present?
    @service_requests = @service_requests.page(params[:page]).per(20)
  end

  def search_service_requests
    @service_requests = @service_requests.where("code LIKE ?", "%#{@q[:name]}%")
  end

  def new
    @service_request = ServiceRequest.new
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    if @service_request.save
      flash[:notice] = 'Service request successfully created.'
      redirect_to service_requests_path
    else
      flash[:error] = @service_request.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @service_request.update_attributes(service_request_params)
      flash[:notice] = 'Service request successfully updated.'
      redirect_to service_requests_path
    else
      flash[:error] = @service_request.errors.full_messages[0]
      render :edit
    end
  end

  def download_report
    @service_requests = ServiceRequest.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=ServiceRequests-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_service_request
    @service_request = ServiceRequest.find_by_id(params[:id])
    unless @service_request
      flash[:error] = "Service request not found."
      redirect_to service_requests_path
    end
  end

  def service_request_params
    params.require(:service_request).permit(
      :code, :request_date, :request_type, :amount, :before_image, :client_id,
      :contact_no, :address1, :address2, :city, :country_id, :state_id,
      :pincode, :status, :pin, :assigned_to, :assigned_on
    )
  end

end