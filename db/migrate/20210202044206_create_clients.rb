class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :gstin
      t.string :email
      t.string :mobile
      t.string :land_line
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :state_id
      t.string :country_id
      t.string :pin_code
      t.string :account_no
      t.string :bank_name
      t.string :ifsc_no
      t.timestamps
    end
  end
end
