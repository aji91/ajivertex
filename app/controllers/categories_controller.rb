class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cat, only: [:edit, :update]

  def index
  	@cats = Category.all
  end

  def new
    @cat = Category.new
  end

  def create
    @cat = Category.new(cat_params)
    if @cat.save
      flash[:notice] = 'Category successfully created.'
      redirect_to categories_path
    else
      flash[:error] = @cat.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update_attributes(cat_params)
      flash[:notice] = 'Category successfully updated.'
      redirect_to categories_path
    else
      flash[:error] = @cat.errors.full_messages[0]
      render :edit
    end
  end

  private

  def set_cat
    @cat = Category.find_by_id(params[:id])
    unless @cat
      flash[:error] = "Category not found."
      redirect_to categories_path
    end
  end

  def cat_params
    params.require(:category).permit(:name, :active)
  end
end