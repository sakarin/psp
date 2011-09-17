class AddStateToSent < ActiveRecord::Migration
  def self.up
    add_column :sents, :state, :integer, :default => 0
  end

  def self.down
    remove_column :sents, :state
  end
end
