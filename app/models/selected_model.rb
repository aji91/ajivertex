class SelectedModel < ApplicationRecord
	belongs_to :modelable, polymorphic: true
	belongs_to :product_model
end
