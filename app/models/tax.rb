class Tax < ApplicationRecord
	scope :cgst, -> { where("name LIKE ?", "CGST%") }
	scope :sgst, -> { where("name LIKE ?", "SGST%") }
	scope :cgst_and_igst, -> { where("name LIKE ? OR name LIKE ?", "CGST%", "IGST%") }
end
