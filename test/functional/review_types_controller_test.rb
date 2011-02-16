require 'test_helper'

class ReviewTypesControllerTest < ActionController::TestCase
  setup do
    @review_type = review_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_type" do
    assert_difference('ReviewType.count') do
      post :create, :review_type => @review_type.attributes
    end

    assert_redirected_to review_type_path(assigns(:review_type))
  end

  test "should show review_type" do
    get :show, :id => @review_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @review_type.to_param
    assert_response :success
  end

  test "should update review_type" do
    put :update, :id => @review_type.to_param, :review_type => @review_type.attributes
    assert_redirected_to review_type_path(assigns(:review_type))
  end

  test "should destroy review_type" do
    assert_difference('ReviewType.count', -1) do
      delete :destroy, :id => @review_type.to_param
    end

    assert_redirected_to review_types_path
  end
end
