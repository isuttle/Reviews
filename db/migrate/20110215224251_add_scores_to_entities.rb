class AddScoresToEntities < ActiveRecord::Migration
  def self.up
    add_column :entities, :avg_score, :float
    add_column :entities, :review_count, :integer
  end

  def self.down
    remove_column :entities, :review_count
    remove_column :entities, :avg_score
  end
end
