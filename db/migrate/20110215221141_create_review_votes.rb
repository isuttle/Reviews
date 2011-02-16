class CreateReviewVotes < ActiveRecord::Migration
  def self.up
    create_table :review_votes do |t|
      t.integer :review_id
      t.string :user_ref
      t.string :user_name
      t.boolean :helpful

      t.timestamps
    end
  end

  def self.down
    drop_table :review_votes
  end
end
