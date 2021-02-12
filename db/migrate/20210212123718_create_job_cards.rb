class CreateJobCards < ActiveRecord::Migration[5.2]
  def change
    create_table :job_cards do |t|
      t.integer :store_request_id
      t.timestamps
    end
  end
end
