class Estimate < ApplicationRecord
	belongs_to :client
	has_many :selected_models, dependent: :destroy

	accepts_nested_attributes_for :selected_models, reject_if: :all_blank, allow_destroy: true

end
