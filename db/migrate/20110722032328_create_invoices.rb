class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string :number
      t.integer :factory_id
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
