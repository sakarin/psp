class CreateLineItem < ActiveRecord::Migration
  def self.up
     create_table :line_items do |t|
      t.integer :invoice_id
      t.integer :order_id
      t.integer :product_id
      t.integer :seek_quantity
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
