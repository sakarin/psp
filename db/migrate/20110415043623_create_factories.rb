class CreateFactories < ActiveRecord::Migration
  def self.up
    create_table :factories do |t|
      t.string :code
      t.string :name
      t.string :collaborator
      t.string :telephone
      t.string :mobile

      t.timestamps
    end
  end

  def self.down
    drop_table :factories
  end
end
