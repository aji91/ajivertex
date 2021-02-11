class ReportsController < ApplicationController
  before_action :authenticate_user!

  def approvals
  	@estimates = Estimate.non_approvals
  	@proformas = Proforma.non_approvals
  	@sale_orders = SaleOrder.non_approvals
  end

  def work_flows
  end

  def view_flow
  end
end