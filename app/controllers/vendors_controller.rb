class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor, only: [:edit, :update, :show]

  def index
  	@vendors = Vendor.all
    @q = params[:search]
    search_vendors if @q.present?
    @vendors = @vendors.page(params[:page]).per(20)
  end

  def search_vendors
    @vendors = @vendors.where("name LIKE ?", "%#{@q[:name]}%")
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:notice] = 'Vendor successfully created.'
      redirect_to vendors_path
    else
      flash[:error] = @vendor.errors.full_messages[0]
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vendor.update_attributes(vendor_params)
      flash[:notice] = 'Vendor successfully updated.'
      redirect_to vendors_path
    else
      flash[:error] = @vendor.errors.full_messages[0]
      render :edit
    end
  end

  def download_report
    @vendors = Vendor.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Vendors-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_vendor
    @vendor = Vendor.find_by_id(params[:id])
    unless @vendor
      flash[:error] = "Vendor not found."
      redirect_to vendors_path
    end
  end

  def vendor_params
    params.require(:vendor).permit(:name, :gstin, :email, :mobile, :land_line, :address_1, :address_2, :city, :country_id, :state_id, :pin_code, :account_no, :bank_name, :ifsc_no, :credit_period)
  end
end