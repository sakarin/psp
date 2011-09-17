class CreatePumps < ActiveRecord::Migration
  def self.up
    create_table :pumps do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pumps
  end
end
