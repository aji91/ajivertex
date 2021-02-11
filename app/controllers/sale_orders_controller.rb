class SaleOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proforma, except: [:index, :download_report]
  before_action :set_sale_order, except: [:new, :index, :create, :download_report]

  def index
  	@sale_orders = SaleOrder.all
    @q = params[:search]
    search_sale_orders if @q.present?
    @sale_orders = @sale_orders.page(params[:page]).per(20)
  end

  def search_sale_orders
    @sale_orders = @sale_orders.where("acceptance_no LIKE ? OR code LIKE ?", "%#{@q[:name]}%", "%#{@q[:name]}%")
  end

  def new
    if @proforma.sale_orders.exists?
      redirect_to proforma_sale_order_path(@proforma.sale_orders.first)
    else
      @sale_order = @proforma.sale_orders.new
      @proforma.selected_models.each do |sm|
        @sale_order.selected_models.build(sm.attributes.to_h.except("id", "modelable_type", "modelable_id", "created_at", "updated_at"))
      end
    end
  end

  def create
    @sale_order = @proforma.sale_orders.new(sale_order_params.merge({created_by: @user.id, client_id: @proforma.client_id}))

    if @sale_order.save
      flash[:notice] = 'Order successfully created.'
      redirect_to sale_orders_path
    else
      flash[:error] = @sale_order.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if !@sale_order.approved?
      if @sale_order.update_attributes(sale_order_params)
        flash[:notice] = 'Order successfully updated.'
        redirect_to sale_orders_path
      else
        flash[:error] = @sale_order.errors.full_messages[0]
        render :edit
      end
    else
      flash[:error] = "Order already approved."
    end
  end

  def approve
    if @sale_order.addressed?
      flash[:error] = "Order already approved or rejected. You can not edit now."
    else
      @sale_order.update_attributes(approved: true, approved_by: @user.id, approved_at: Time.zone.now)
      flash[:notice] = "Order approved."
    end
    redirect_back(fallback_location: '/sale_orders')
  end

  def reject
    if @sale_order.addressed?
      flash[:error] = "Order already approved or rejected. You can not edit now."
    else
      @sale_order.update_attributes(rejected: true, rejected_by: @user.id, rejected_at: Time.zone.now)
      flash[:notice] = "Order rejected."
    end
    redirect_back(fallback_location: '/sale_orders')
  end

  def download_report
    @sale_orders = SaleOrder.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Proformas-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_proforma
    @proforma = Proforma.find_by_id(params[:proforma_id])
    unless @proforma
      flash[:error] = "Proforma not found."
      redirect_to proformas_path
    end
  end

  def set_sale_order
    @sale_order = SaleOrder.find_by_id(params[:id])
    unless @sale_order
      flash[:error] = "Order not found."
      redirect_to sale_orders_path
    end
  end

  def sale_order_params
    params.require(:sale_order).permit(
      :vendor_id, :acceptance_no, :delivery_address_lin1, :delivery_address_lin2,
      :delivery_city, :delivery_pin_code, :delivery_date, :terms, :notes, :sub_total, :cgst, :sgst, :total, :code,
      selected_models_attributes: [:id, :tax_id, :product_model_id, :hsn, :quantity, :rate, :cgst, :sgst, :amount, :_destroy]
    )
  end
end