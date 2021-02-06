class ReportsController < ApplicationController
  before_action :authenticate_user!

  def approvals
  	@estimates = Estimate.non_approvals
  end
end