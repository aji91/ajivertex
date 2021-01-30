class ProductModel < ApplicationRecord
  mount_uploader :image, ImageUploader

  # def remove_empty
  #   self.job_category_ids = self.job_category_ids.reject(&:blank?)
  # end
end
