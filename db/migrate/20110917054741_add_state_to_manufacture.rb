class AddStateToManufacture < ActiveRecord::Migration
  def self.up
    add_column :manufactures, :state, :integer, :default => 0
  end

  def self.down
    remove_column :manufactures, :state
  end
end
