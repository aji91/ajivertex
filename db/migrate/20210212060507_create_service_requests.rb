class CreateServiceRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :service_requests do |t|
      t.string :code
      t.datetime :request_date
      t.string :request_type
      t.string :amount
      t.string :before_image
      t.string :after_image
      t.integer :client_id
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :country_id
      t.integer :state_id
      t.string :pincode
      t.string :contact_no
      t.string :status
      t.string :pin
      t.integer :assigned_to
      t.datetime :assigned_on
      t.timestamps
    end
  end
end
