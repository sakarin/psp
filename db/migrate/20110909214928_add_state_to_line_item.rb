class AddStateToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :state, :integer, :default => 0
  end

  def self.down
    remove_column :line_items, :state
  end
end
