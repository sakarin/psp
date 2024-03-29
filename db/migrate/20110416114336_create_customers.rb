class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :department
      t.string :collaborator
      t.string :address
      t.string :telephone
      t.string :mobile
      t.string :fax
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
