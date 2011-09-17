class AddQuantityToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :quantity, :integer, :default => 0
    add_column :products, :material, :integer, :default => 0
  end

  def self.down
    remove_column :products, :quantity
    remove_column :products, :material
  end
end
