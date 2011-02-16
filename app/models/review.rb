class Review < ActiveRecord::Base
  # relationships
  belongs_to :entity
  belongs_to :app
  belongs_to :review_type
  has_many :review_votes
  
  # filters
  after_create :update_entity_scores
  
  # validations
  
  
  # updates the entity's score aggregate info
  def update_entity_scores
    self.entity.review_count = self.entity.review_count + 1
    self.entity.avg_score = (self.entity.avg_score + self.score) / 2
    self.entity.save!
  end
end
