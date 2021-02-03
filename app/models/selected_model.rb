class SelectedModel < ApplicationRecord
	belongs_to :estimate
	belongs_to :product_model
	belongs_to :tax
end
