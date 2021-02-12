class StoreRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store_request, except: [:index, :download_report]

  def index
  	@store_requests = StoreRequest.all
    @q = params[:search]
    search_store_requests if @q.present?
    @store_requests = @store_requests.page(params[:page]).per(20)
  end

  def search_store_requests
    @store_requests = @store_requests.where("code LIKE ?", "%#{@q[:name]}%", "%#{@q[:name]}%")
  end

  def edit
  end

  def update
    if !@store_request.approved?
      if @store_request.update_attributes(store_request_params)
        flash[:notice] = 'Store request successfully updated.'
        redirect_to store_requests_path
      else
        flash[:error] = @store_request.errors.full_messages[0]
        render :edit
      end
    else
      flash[:error] = "Store request already approved."
    end
  end

  def approve
    if @store_request.addressed?
      flash[:error] = "Store request already approved or rejected. You can not edit now."
    else
      @store_request.update_attributes(approved: true, approved_by: @user.id, approved_at: Time.zone.now)
      flash[:notice] = "Store request approved."
    end
    redirect_back(fallback_location: '/store_requests')
  end

  def reject
    if @store_request.addressed?
      flash[:error] = "Store request already approved or rejected. You can not edit now."
    else
      @store_request.update_attributes(rejected: true, rejected_by: @user.id, rejected_at: Time.zone.now)
      flash[:notice] = "Store request rejected."
    end
    redirect_back(fallback_location: '/store_requests')
  end

  def download_report
    @store_requests = StoreRequest.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=StoreRequests-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_store_request
    @store_request = StoreRequest.find_by_id(params[:id])
    unless @store_request
      flash[:error] = "Store request not found."
      redirect_to store_requests_path
    end
  end

  def store_request_params
    params.require(:store_request).permit(:notes)
  end
end