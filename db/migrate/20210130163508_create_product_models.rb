class CreateProductModels < ActiveRecord::Migration[5.2]
  def change
    create_table :product_models do |t|
      t.string :name
      t.string :input_range
      t.string :output_range
      t.string :frequency
      t.string :protections
      t.string :kva
      t.string :optional
      t.string :image
      t.string :hsn
      t.string :price
      t.timestamps
    end
  end
end
