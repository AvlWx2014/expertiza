require 'test_helper'

class ReviewTimesControllerTest < ActionController::TestCase
  setup do
    @review_time = review_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_time" do
    assert_difference('ReviewTime.count') do
      post :create, review_time: { time_data: @review_time.time_data }
    end

    assert_redirected_to review_time_path(assigns(:review_time))
  end

  test "should show review_time" do
    get :show, id: @review_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_time
    assert_response :success
  end

  test "should update review_time" do
    patch :update, id: @review_time, review_time: { time_data: @review_time.time_data }
    assert_redirected_to review_time_path(assigns(:review_time))
  end

  test "should destroy review_time" do
    assert_difference('ReviewTime.count', -1) do
      delete :destroy, id: @review_time
    end

    assert_redirected_to review_times_path
  end
end
