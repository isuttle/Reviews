class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities do |t|
      t.integer :app_id
      t.string :foreign_id
      t.string :foreign_url

      t.timestamps
    end
  end

  def self.down
    drop_table :entities
  end
end
