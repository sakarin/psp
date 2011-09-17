class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :code
      t.integer :product_type
      t.integer :customer_id
      t.string :name
      t.string :print_color
      t.integer :pump_id
      t.integer :pump_line_id
      t.integer :glue_id
      t.string :paper
      t.string :thick
      t.integer :cut_id
      t.string :size
      t.string :width
      t.string :high
      t.string :side
      t.string :cut_unit
      t.integer :coat_id
      t.integer :mouth_id
      t.string :bottom
      t.integer :ear
      t.string :ear_number
      t.string :ear_long
      t.string :ear_unit
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
