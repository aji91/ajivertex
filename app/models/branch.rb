class Branch < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
  belongs_to :state, optional: true
  belongs_to :country, optional: true
  
  def full_address
    "#{address_1} #{address_2} #{city}"
  end
end
