class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User successfully created.'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'User successfully updated.'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages[0]
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
    unless @user
      flash[:error] = "User not found."
      redirect_to users_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :gstin, :email, :mobile, :land_line, :address_1, :address_2, :city, :country_id, :state_id, :pin_code, :account_no, :bank_name, :ifsc_no, :credit_period)
  end
end