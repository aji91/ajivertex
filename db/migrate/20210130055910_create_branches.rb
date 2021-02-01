class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :gstin
      t.string :email
      t.string :mobile
      t.text :address_1
      t.text :address_2
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.string :pin_code
      t.timestamps
    end
  end
end
