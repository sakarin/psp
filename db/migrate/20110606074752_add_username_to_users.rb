class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :name, :string
    
  end

  def self.down
    remove_column :users, :username
    remove_column :users, :name
    
  end
end
