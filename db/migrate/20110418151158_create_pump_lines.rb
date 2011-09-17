class CreatePumpLines < ActiveRecord::Migration
  def self.up
    create_table :pump_lines do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pump_lines
  end
end
