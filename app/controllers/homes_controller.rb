class HomesController < ApplicationController

  def get_states
    states = (State.select("id,state_name").where(country_id: params[:country_id]).map{|t| {t.id => t.state_name}}.reduce Hash.new, :merge).to_json
    render json: states
  end
end