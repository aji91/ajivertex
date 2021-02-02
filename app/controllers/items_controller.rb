class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :update]

  def index
  	@items = Item.all
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

  private

  def set_item
    @item = Item.find_by_id(params[:id])
    unless @item
      flash[:error] = "Item not found."
      redirect_to items_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :active)
  end
end