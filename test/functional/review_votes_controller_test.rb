require 'test_helper'

class ReviewVotesControllerTest < ActionController::TestCase
  setup do
    @review_vote = review_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_vote" do
    assert_difference('ReviewVote.count') do
      post :create, :review_vote => @review_vote.attributes
    end

    assert_redirected_to review_vote_path(assigns(:review_vote))
  end

  test "should show review_vote" do
    get :show, :id => @review_vote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @review_vote.to_param
    assert_response :success
  end

  test "should update review_vote" do
    put :update, :id => @review_vote.to_param, :review_vote => @review_vote.attributes
    assert_redirected_to review_vote_path(assigns(:review_vote))
  end

  test "should destroy review_vote" do
    assert_difference('ReviewVote.count', -1) do
      delete :destroy, :id => @review_vote.to_param
    end

    assert_redirected_to review_votes_path
  end
end
