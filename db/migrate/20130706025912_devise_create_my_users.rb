class DeviseCreateMyUsers < ActiveRecord::Migration
  def self.up
    create_table(:my_users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :my_users, :email,                :unique => true
    add_index :my_users, :confirmation_token,   :unique => true
    add_index :my_users, :reset_password_token, :unique => true
    # add_index :my_users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :my_users
  end
end
