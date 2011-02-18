require 'test_helper'

class ReviewVoteTest < ActiveSupport::TestCase
  test "vote on an invalid :review_id should fail" do
    vote = ReviewVote.new(:review_id => 99999, :helpful => true, :user_ref => 'tester')
    assert !vote.valid?, "Invalid review_id was allowed to pass!"
  end
  
  test "vote without :user_ref should fail" do
    vote = ReviewVote.new(:review_id => 1, :helpful => true)
    assert !vote.valid?, "ReviewVote structure is valid without including user_ref!"
  end
end
