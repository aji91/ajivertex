class BranchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch, only: [:edit, :update]

  def index
  	@branches = Branch.all
  end

  def new
    @branch = Branch.new
  end

  def edit
  end

  def update
  end

  private

  def set_branch
    @branch = Branch.find_by_id(params[:id])
    unless @branch
      flash[:error] = "Branch not found."
      redirect_to branches_path
    end
  end
end