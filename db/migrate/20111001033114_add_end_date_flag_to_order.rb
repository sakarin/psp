class AddEndDateFlagToOrder < ActiveRecord::Migration
   def self.up
    add_column :orders, :end_date_flag, :integer, :default => 0
  end

  def self.down
    remove_column :orders, :end_date_flag
  end
end
