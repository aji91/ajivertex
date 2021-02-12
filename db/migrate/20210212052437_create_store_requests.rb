class CreateStoreRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :store_requests do |t|
      t.integer :requested_by
      t.integer :client_id
      t.integer :vendor_id
      t.integer :sale_order_id
      t.datetime :delivery_date
      t.text :notes
      t.string :code
      t.boolean :approved, default: false
      t.integer :approved_by
      t.datetime :approved_at
      t.boolean :rejected, default: false
      t.integer :rejected_by
      t.datetime :rejected_at
      t.timestamps
    end
  end
end
