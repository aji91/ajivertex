# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :employee_code
      t.boolean :active,default: true
      t.belongs_to :branch, foreign_key: true
      t.belongs_to :department, foreign_key: true
      t.belongs_to :role, foreign_key: true

      ## Database authenticatable
      t.string :username,              null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :pan_file
      t.string :aadhar_file
      t.string :photo
      t.string :pan_no
      t.string :aadhar_no
      t.string :bank_name
      t.string :account_no
      t.string :ifsc_no
      t.string :unique_session_id

      t.timestamps null: false
    end

    add_index :users, :username,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
