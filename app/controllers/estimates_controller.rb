class EstimatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate, only: [:edit, :update, :show, :order_notes]

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

  def show
  end

  def update
    if !@estimate.approved?
      if @estimate.update_attributes(estimate_params)
        flash[:notice] = 'Estimate successfully updated.'
        redirect_to estimates_path
      else
        flash[:error] = @estimate.errors.full_messages[0]
        render :edit
      end
    else
      flash[:error] = "Estimate already approved. You can not edit now."
    end
  end

  def update_status
  end

  def order_notes
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
    params.require(:estimate).permit(
      :client_id, :code, :terms, :notes, :sub_total, :cgst, :sgst, :total,
      selected_models_attributes: [:id, :tax_id, :product_model_id, :hsn, :quantity, :rate, :cgst, :sgst, :amount, :_destroy]
    )
  end
end