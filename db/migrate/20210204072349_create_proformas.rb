class CreateProformas < ActiveRecord::Migration[5.2]
  def change
    create_table :proformas do |t|
      t.integer :client_id
      t.string :code
      t.text :terms
      t.text :notes
      t.string :sub_total
      t.string :cgst
      t.string :sgst
      t.string :total
      t.boolean :approved, default: false
      t.integer :approved_by
      t.timestamps
    end
  end
end
