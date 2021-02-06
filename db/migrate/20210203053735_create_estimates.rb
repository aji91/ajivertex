class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.integer :created_by
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
      t.boolean :rejected, default: false
      t.integer :rejected_by
      t.timestamps
    end
  end
end
