class CreateSents < ActiveRecord::Migration
  def self.up
    create_table :sents do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :sents
  end
end
