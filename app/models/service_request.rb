class ServiceRequest < ApplicationRecord
  belongs_to :client
  mount_uploader :before_image, ImageUploader
  mount_uploader :after_image, ImageUploader
    
  def new_code
    ee = ServiceRequest.where("created_at >= ?", Time.now.beginning_of_year).last
    if ee
      ss = ee.code.split('/')[2]
      "SER/#{Time.now.year}/#{ss.to_i + 1}"
    else
      "SER/#{Time.now.year}/1"
    end
  end
end
