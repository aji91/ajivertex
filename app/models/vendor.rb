class Vendor < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	belongs_to :state, optional: true
	belongs_to :country, optional: true
end
