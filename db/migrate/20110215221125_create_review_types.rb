class CreateReviewTypes < ActiveRecord::Migration
  def self.up
    create_table :review_types do |t|
      t.integer :app_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :review_types
  end
end
