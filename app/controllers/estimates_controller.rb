class EstimatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_estimate, except: [:index, :new, :create, :download_report]

  def index
  	@estimates = Estimate.all
    @q = params[:search]
    search_estimates if @q.present?
    @estimates = @estimates.page(params[:page]).per(20)
  end

  def search_estimates
    @estimates = @estimates.where("code LIKE ?", "%#{@q[:name]}%")
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
    if @estimate.addressed?
      flash[:error] = "Estimate already approved or rejected. You can not edit now."
      redirect_to estimates_path
    end
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
      flash[:error] = "Estimate already approved or rejected. You can not edit now."
    else
      @estimate.update_attributes(approved: true, approved_by: @user.id, approved_at: Time.zone.now)

      proforma = @estimate.build_proforma(
        client_id: @estimate.client_id,
        code: Proforma.new.new_code,
        terms: @estimate.terms,
        notes: @estimate.notes,
        sub_total: @estimate.sub_total,
        cgst: @estimate.cgst,
        sgst: @estimate.sgst,
        total: @estimate.total
        )

      @estimate.selected_models.each do |sm|
        proforma.selected_models.build(sm.attributes.to_h.except("id", "modelable_type", "modelable_id", "created_at", "updated_at"))
      end

      if proforma.save
        flash[:notice] = "Estimate approved."
      else
        @estimate.update_attributes(approved: false, approved_by: nil, approved_at: nil)
        flash[:error] = proforma.errors.full_messages[0]
      end
    end
    redirect_back(fallback_location: '/estimates')
  end

  def reject
    if @estimate.addressed?
      flash[:error] = "Estimate already approved or rejected. You can not edit now."
    else
      @estimate.update_attributes(rejected: true, rejected_by: @user.id, rejected_at: Time.zone.now)
      flash[:notice] = "Estimate rejected."
    end
    redirect_back(fallback_location: '/estimates')
  end

  def download_report
    @estimates = Estimate.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Estimates-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
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