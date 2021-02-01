class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:edit, :update]

  def index
  	@departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(dep_params)
    if @department.save
      flash[:notice] = 'Department successfully created.'
      redirect_to departments_path
    else
      flash[:error] = @department.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update_attributes(dep_params)
      flash[:notice] = 'Department successfully updated.'
      redirect_to departments_path
    else
      flash[:error] = @department.errors.full_messages[0]
      render :edit
    end
  end

  private

  def set_department
    @department = Department.find_by_id(params[:id])
    unless @department
      flash[:error] = "Department not found."
      redirect_to departments_path
    end
  end

  def dep_params
    params.require(:department).permit(:name)
  end
end