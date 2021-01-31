class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:edit, :update]

  def index
  	@departments = Department.all
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def update
  end

  private

  def set_department
    @department = Department.find_by_id(params[:id])
    unless @department
      flash[:error] = "Department not found."
      redirect_to departments_path
    end
  end
end