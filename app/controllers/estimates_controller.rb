class EstimatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate, except: [:index, :new, :create]

  def index
  	@estimates = Estimate.all
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params.merge({created_by: @user.id}))
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
    if @estimate.addressed?
      flash[:error] = "Estimate already approved or rejected. You can not edit now."
    else
      if @estimate.update_attributes(estimate_params)
        flash[:notice] = 'Estimate successfully updated.'
        redirect_to estimates_path
      else
        flash[:error] = @estimate.errors.full_messages[0]
        render :edit
      end
    end
  end

  def update_status
  end

  def order_notes
    redirect_to estimate_path(@estimate)
  end

  def approve
    if @estimate.addressed?
    else
    end
  end

  def reject
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