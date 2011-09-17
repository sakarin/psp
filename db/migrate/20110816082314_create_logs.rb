class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :user
      t.string :system
      t.string :action
      t.string :result
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
