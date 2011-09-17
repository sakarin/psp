class AddInvoiceFlagToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :invoice_flag, :integer, :default => 0
  end

  def self.down
    remove_column :orders, :invoice_flag
  end
end
