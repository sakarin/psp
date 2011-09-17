class AddStateToStock < ActiveRecord::Migration
  def self.up
    add_column :stocks, :state, :integer, :default => 0
  end

  def self.down
    remove_column :stocks, :state
  end

end
