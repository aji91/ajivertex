class CreateAmcRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :amc_requests do |t|

      t.timestamps
    end
  end
end
