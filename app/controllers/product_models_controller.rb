class ProductModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model, only: [:edit, :update]

  def index
  	@product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
  end

  def create
    @product_model = ProductModel.new(model_params)
    if @product_model.save
      flash[:notice] = 'Product model successfully created.'
      redirect_to product_models_path
    else
      flash[:error] = @product_model.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @product_model.update_attributes(model_params)
      flash[:notice] = 'Product model successfully updated.'
      redirect_to product_models_path
    else
      flash[:error] = @product_model.errors.full_messages[0]
      render :edit
    end
  end

  private

  def set_model
    @product_model = ProductModel.find_by_id(params[:id])
    unless @product_model
      flash[:error] = "Product model not found."
      redirect_to product_models_path
    end
  end

  def model_params
    params.require(:product_model).permit(:name, :input_range, :output_range, :frequency, :protections, :kva, :optional, :hsn, :price, :image)
  end
end