class CreateCuts < ActiveRecord::Migration
  def self.up
    create_table :cuts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cuts
  end
end
