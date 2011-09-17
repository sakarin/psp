class AddStateToOrder < ActiveRecord::Migration
  def self.up
     change_table :orders do |t|
        t.string :state
        t.datetime :complete_at
    end
  end

  def self.down
     change_table :line_items do |t|
        t.remove :state
        t.remove :complete_at
      end
  end
end
