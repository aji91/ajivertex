class Category < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	validates :name, presence: true
	validates :name, uniqueness: true
	scope :active_cats, -> { where(active: true) }
end
