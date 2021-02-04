class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :show]

  def index
  	@users = User.all
    @q = params[:search]
    search_users if @q.present?
    @users = @users.page(params[:page]).per(20)
  end

  def search_users
    @users = @users.where("name LIKE ?", "%#{@q[:name]}%")
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

  def show
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

  def download_report
    @users = User.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Users-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
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
    params.require(:user).permit(:name, :username, :email, :mobile, :employee_code, :department_id, :branch_id, :role_id, :account_no, :bank_name, :ifsc_no, :aadhar_no, :aadhar_file, :pan_no, :pan_file, :password, :password_confirmation)
  end
end