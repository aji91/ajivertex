class ProductModel < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
	mount_uploader :image, ImageUploader

  # def remove_empty
  #   self.job_category_ids = self.job_category_ids.reject(&:blank?)
  # end
end
