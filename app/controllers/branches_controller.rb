class BranchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch, only: [:edit, :update]

  def index
  	@branches = Branch.all
    @q = params[:search]
    search_branches if @q.present?
    @branches = @branches.page(params[:page]).per(20)
  end

  def search_branches
    @branches = @branches.where("name LIKE ?", "%#{@q[:name]}%")
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      flash[:notice] = 'Branch successfully created.'
      redirect_to branches_path
    else
      flash[:error] = @branch.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def update
    if @branch.update_attributes(branch_params)
      flash[:notice] = 'Branch successfully updated.'
      redirect_to branches_path
    else
      flash[:error] = @branch.errors.full_messages[0]
      render :edit
    end
  end

  def download_report
    @branches = Branch.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment;filename=Branches-#{Date.today.strftime('%m/%d/%Y')}.xlsx"
      }
    end
  end

  private

  def set_branch
    @branch = Branch.find_by_id(params[:id])
    unless @branch
      flash[:error] = "Branch not found."
      redirect_to branches_path
    end
  end

  def branch_params
    params.require(:branch).permit(:name, :gstin, :email, :mobile, :address_1, :address_2, :city, :country_id, :state_id, :pin_code)
  end
end