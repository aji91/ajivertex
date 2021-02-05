class ProformasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proforma, only: [:edit, :update]

  def index
  	@proformas = Proforma.all
  end

  def new
    @proforma = Proforma.new
  end

  def create
    @proforma = Proforma.new(proforma_params)
    if @proforma.save
      flash[:notice] = 'Proforma successfully created.'
      redirect_to proformas_path
    else
      flash[:error] = @proforma.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if !@proforma.approved?
      if @proforma.update_attributes(proforma_params)
        flash[:notice] = 'Proforma successfully updated.'
        redirect_to proformas_path
      else
        flash[:error] = @proforma.errors.full_messages[0]
        render :edit
      end
    else
      flash[:error] = "Proforma already approved."
    end
  end

  def update_status
  end

  def order_notes
  end

  private

  def set_proforma
    @proforma = Proforma.find_by_id(params[:id])
    unless @proforma
      flash[:error] = "Proforma not found."
      redirect_to proformas_path
    end
  end

  def proforma_params
    params.require(:proforma).permit(
      :client_id, :code, :terms, :notes, :sub_total, :cgst, :sgst, :total,
      selected_models_attributes: [:id, :tax_id, :product_model_id, :hsn, :quantity, :rate, :cgst, :sgst, :amount, :_destroy]
    )
  end
end