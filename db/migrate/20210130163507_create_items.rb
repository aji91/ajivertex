class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :hsn
      t.string :code
      t.string :part_number
      t.string :specification
      t.string :remaining_quantity
      t.string :sell_price
      t.string :purchase_price
      t.string :unit
      t.integer :opening_stock
      t.integer :minimum_quantity
      t.boolean :active, default: true
      t.integer :category_id
      t.timestamps
    end
  end
end
