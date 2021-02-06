class HomesController < ApplicationController

  def get_states
    states = (State.select("id,state_name").where(country_id: params[:country_id]).map{|t| {t.id => t.state_name}}.reduce Hash.new, :merge).to_json
    render json: states
  end

  def get_product
  	model = ProductModel.find_by_id(params[:pid])
  	render json: { hsn: model ? model.hsn : nil, price: model ? model.price : nil }
  end

  def find_tax
  	tax = Tax.cgst.find_by_name(params[:tid])
  	if tax
  		aa = tax.name.split('-')[1]
      sgst = Tax.sgst.find_by_name("SGST-#{aa}")
  		render json: { success: false, sgst: sgst ? sgst.name : '' }
  	else
  		render json: { success: false }
  	end
  end
end