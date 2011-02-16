class ReviewVote < ActiveRecord::Base
  # relationships
  belongs_to :review
  
  # filters
  after_create :add_review_votes_to_review
  
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
end
