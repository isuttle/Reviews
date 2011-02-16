class AddNameToEntities < ActiveRecord::Migration
  def self.up
    add_column :entities, :name, :string
  end

  def self.down
    remove_column :entities, :name
  end
end
