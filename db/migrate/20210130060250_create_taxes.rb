class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :name
      t.string :percentage
      t.string :tax_type
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
