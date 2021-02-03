class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :update, :show]

  def index
  	@items = Item.all
    @q = params[:search]
    search_items if @q.present?
    @items = @items.page(params[:page]).per(20)
  end

  def search_items
    @items = @items.where("name LIKE ?", "%#{@q[:name]}%")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Item successfully created.'
      redirect_to items_path
    else
      flash[:error] = @item.errors.full_messages[0]
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      flash[:notice] = 'Item successfully updated.'
      redirect_to items_path
    else
      flash[:error] = @item.errors.full_messages[0]
      render :edit
    end
  end

  def download_report
    @items = Item.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Items-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_item
    @item = Item.find_by_id(params[:id])
    unless @item
      flash[:error] = "Item not found."
      redirect_to items_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :hsn, :code, :part_number, :specification, :remaining_quantity, :sell_price, :purchase_price, :unit, :opening_stock, :minimum_quantity, :category_id, :active)
  end
end