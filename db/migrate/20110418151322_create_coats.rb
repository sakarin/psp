class CreateCoats < ActiveRecord::Migration
  def self.up
    create_table :coats do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :coats
  end
end
