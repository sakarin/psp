class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :factory_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
