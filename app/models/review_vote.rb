class ReviewVote < ActiveRecord::Base
=begin
  t.integer :review_id
  t.string :user_ref
  t.string :user_name
  t.boolean :helpful

  t.timestamps
=end

  # relationships
  belongs_to :review
  
  # callbacks
  after_create :add_review_votes_to_review
  before_create :ensure_default_values
  before_save :ensure_default_values
  
  # validations
  validates :user_ref, :presence => true
  validates :review_id, :presence => true
  validate :ensure_review_is_valid
  

  private

    # adds the review votes to the review's helpful_count
    def add_review_votes_to_review
      # increment the count of votes regardless of stance
      if self.review.helpful_count.nil?
        self.review.helpful_count = 1
      else
        self.review.helpful_count += 1
      end

      # adjust the score to incorporate the up-vote, if it's an up-vote
      if self.helpful?
        if self.review.helpful_score.nil?
          self.review.helpful_score = 1
        else
          self.review.helpful_score += 1
        end
      end
    
      self.review.save!
    end
    
    def ensure_default_values
      self.user_name = "" if self.user_name.nil?
    end
    
    def ensure_review_is_valid
      return !self.review.nil?
    end
end
