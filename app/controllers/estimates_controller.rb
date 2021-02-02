class EstimatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate, only: [:edit, :update]

  def index
  	@estimates = Estimate.all
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      flash[:notice] = 'Estimate successfully created.'
      redirect_to estimates_path
    else
      flash[:error] = @estimate.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @estimate.approved?
      if @estimate.update_attributes(estimate_params)
        flash[:notice] = 'Estimate successfully updated.'
        redirect_to estimates_path
      else
        flash[:error] = @estimate.errors.full_messages[0]
        render :edit
      end
    else
      flash[:error] = "Estimate already approved."
    end
  end

  def update_status
  end

  private

  def set_estimate
    @estimate = Estimate.find_by_id(params[:id])
    unless @estimate
      flash[:error] = "Estimate not found."
      redirect_to estimates_path
    end
  end

  def estimate_params
    params.require(:estimate).permit(:name, :gstin, :email, :mobile, :address_1, :address_2, :city, :country_id, :state_id, :pin_code)
  end
end