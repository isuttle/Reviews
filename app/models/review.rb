class Review < ActiveRecord::Base
=begin
t.integer :app_id
t.integer :entity_id
t.string :user_ref
t.string :user_name
t.string :title
t.text :body
t.float :score
t.integer :helpful_count
t.:integer :helpful_score

t.timestamps
=end
  
  # relationships
  belongs_to :entity
  belongs_to :app
  belongs_to :review_type
  has_many :review_votes
  
  # callbacks
  before_create :ensure_default_values
  before_save :ensure_default_values
  after_create :update_entity_scores
  
  # validations
  validates :user_ref, :presence => true
  validates :user_name, :presence => true
  validates_numericality_of :score, :greater_than_or_equal_to => 0
  validates_numericality_of :score, :less_than_or_equal_to => 10
  validate :entity_must_exist
  validate :app_must_exist
  
  private

    def app_must_exist
      if self.app.nil?
        self.errors.add(:app_id, "The specified app does not exist.")
      end
    end

    def ensure_default_values
      self.body = "" if self.body.nil?
      self.helpful_count = 0 if self.helpful_count.nil?
      self.helpful_score = 0 if self.helpful_score.nil?
      self.title = "" if self.title.nil?
    end

    def entity_must_exist
      if self.entity.nil?
        self.errors.add(:entity_id, "The specified entity does not exist.")
      end
    end
  
    # updates the entity's score aggregate info
    def update_entity_scores
      return if self.entity.nil?
      # TODO: wrap transaction around update to entity record
      self.entity.review_count = self.entity.review_count + 1
      self.entity.avg_score = (self.entity.avg_score + self.score) / 2
      self.entity.save!
    end
end
