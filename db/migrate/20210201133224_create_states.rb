class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.integer :country_id
      t.string :state_name
      t.string :state_code
      t.integer :visible
      t.timestamps
    end
  end
end
