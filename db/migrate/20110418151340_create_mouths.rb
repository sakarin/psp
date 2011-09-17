class CreateMouths < ActiveRecord::Migration
  def self.up
    create_table :mouths do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mouths
  end
end
