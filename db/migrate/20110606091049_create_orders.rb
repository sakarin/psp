class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :number
      t.integer :user_id
      t.integer :customer_id
      t.integer :product_id
      t.date :start_date
      t.date :end_date
      t.integer :quantity
      t.string :note

      t.integer :manufacture_flag, :default => 0
      t.integer :stock_flag, :default => 0
      t.integer :sent_flag, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
