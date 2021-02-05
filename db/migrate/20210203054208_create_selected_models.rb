class CreateSelectedModels < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_models do |t|
      t.integer :product_model_id
      t.integer :tax_id
      t.string :pro_name
      t.string :hsn
      t.integer :quantity
      t.string :rate
      t.string :cgst
      t.string :sgst
      t.string :amount
      t.string :modelable_type
      t.bigint :modelable_id

      t.timestamps
    end
  end
end
