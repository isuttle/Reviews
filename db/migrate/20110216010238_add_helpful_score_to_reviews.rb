class AddHelpfulScoreToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :helpful_score, :integer
  end

  def self.down
    remove_column :reviews, :helpful_score
  end
end
