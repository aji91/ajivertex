class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :city
      t.string :pin_code
      t.string :mobile
      t.string :gstin
      t.timestamps
    end
  end
end
