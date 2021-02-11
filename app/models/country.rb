class Country < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	scope :asc_order, -> { order(name: :asc) }
end
