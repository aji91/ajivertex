class HomesController < ApplicationController

  def get_states
    states = (State.select("id,state_name").where(country_id: params[:country_id]).map{|t| {t.id => t.state_name}}.reduce Hash.new, :merge).to_json
    render json: states
  end

  def get_product
  	model = ProductModel.find_by_id(params[:pid])
  	render json: { hsn: model ? model.hsn : nil }
  end

  def find_tax
  	tax = Tax.find_by_id(params[:tid])
  	if tax
  		tax.name.split('-')
  		render json: { success: false }
  	else
  		render json: { success: false }
  	end
  end
end