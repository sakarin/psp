class CreateGlues < ActiveRecord::Migration
  def self.up
    create_table :glues do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :glues
  end
end
