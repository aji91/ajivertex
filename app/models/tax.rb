class Tax < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	scope :cgst, -> { where("name LIKE ?", "CGST%") }
	scope :sgst, -> { where("name LIKE ?", "SGST%") }
	scope :cgst_and_igst, -> { where("name LIKE ? OR name LIKE ?", "CGST%", "IGST%") }
end
