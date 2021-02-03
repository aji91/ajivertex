class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cat, only: [:edit, :update]

  def index
  	@cats = Category.all
    @q = params[:search]
    search_cats if @q.present?
    @cats = @cats.page(params[:page]).per(20)
  end

  def search_cats
    @cats = @cats.where("name LIKE ?", "%#{@q[:name]}%")
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

  def download_report
    @cats = Category.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Categories-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
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