class CreateSaleOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_orders do |t|
      t.integer :created_by
      t.integer :client_id
      t.integer :proforma_id
      t.integer :vendor_id
      t.text :acceptance_no
      t.text :delivery_address_lin1
      t.text :delivery_address_lin2
      t.string :delivery_city
      t.string :delivery_pin_code
      t.datetime :delivery_date
      t.string :code
      t.text :terms
      t.text :notes
      t.string :sub_total
      t.string :cgst
      t.string :sgst
      t.string :total
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
