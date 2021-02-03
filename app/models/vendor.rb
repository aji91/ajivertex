class Vendor < ApplicationRecord
	belongs_to :state, optional: true
	belongs_to :country, optional: true
end
