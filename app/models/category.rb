class Category < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: true
	scope :active_cats, -> { where(active: true) }
end
