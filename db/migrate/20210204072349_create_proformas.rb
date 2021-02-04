class CreateProformas < ActiveRecord::Migration[5.2]
  def change
    create_table :proformas do |t|

      t.timestamps
    end
  end
end
