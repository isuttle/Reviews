class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :app_id
      t.integer :entity_id
      t.string :user_ref
      t.string :user_name
      t.string :title
      t.text :body
      t.float :score
      t.integer :helpful_count

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
