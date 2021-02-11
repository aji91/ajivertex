class ProformasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proforma, except: [:new, :index, :create, :download_report]

  def index
  	@proformas = Proforma.all
    @q = params[:search]
    search_proformas if @q.present?
    @proformas = @proformas.page(params[:page]).per(20)
  end

  def search_proformas
    @proformas = @proformas.where("code LIKE ?", "%#{@q[:name]}%")
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
    if @proforma.addressed?
      flash[:error] = "Proforma already approved or rejected. You can not edit now."
      redirect_to proformas_path
    end
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
    redirect_to proforma_path(@proforma)
  end

  def approve
    if @proforma.addressed?
      flash[:error] = "Proforma already approved or rejected. You can not edit now."
    else
      @proforma.update_attributes(approved: true, approved_by: @user.id, approved_at: Time.zone.now)
      flash[:notice] = "Proforma approved."
    end
    redirect_back(fallback_location: '/proformas')
  end

  def reject
    if @proforma.addressed?
      flash[:error] = "Proforma already approved or rejected. You can not edit now."
    else
      @proforma.update_attributes(rejected: true, rejected_by: @user.id, rejected_at: Time.zone.now)
      flash[:notice] = "Proforma rejected."
    end
    redirect_back(fallback_location: '/proformas')
  end

  def download_report
    @proformas = Proforma.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Proformas-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
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