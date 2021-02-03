class Client < ApplicationRecord
	belongs_to :state, optional: true
	belongs_to :country, optional: true
	scope :asc_order, -> { order(name: :asc) }
end
