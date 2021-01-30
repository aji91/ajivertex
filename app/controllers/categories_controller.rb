class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cat, only: [:edit, :update]

  def index
  	@cats = Category.all
  end

  def new
    @cat = Category.new
  end

  def edit
  end

  def update
  end

  private

  def set_cat
    @cat = Category.find_by_id(params[:id])
    unless @cat
      flash[:error] = "Category not found."
      redirect_to categories_path
    end
  end
end