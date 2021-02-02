class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :gstin
      t.string :land_line
      t.string :mobile
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :state_id
      t.string :country_id
      t.string :pin_code
      t.string :credit_period
      t.string :account_no
      t.string :bank_name
      t.string :ifsc_no
      t.timestamps
    end
  end
end
