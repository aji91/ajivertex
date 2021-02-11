class Item < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	belongs_to :category
end
