require 'test_helper'

class NoticeQueuesControllerTest < ActionController::TestCase
  setup do
    @notice_queue = notice_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notice_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notice_queue" do
    assert_difference('NoticeQueue.count') do
      post :create, notice_queue: @notice_queue.attributes
    end

    assert_redirected_to notice_queue_path(assigns(:notice_queue))
  end

  test "should show notice_queue" do
    get :show, id: @notice_queue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notice_queue.to_param
    assert_response :success
  end

  test "should update notice_queue" do
    put :update, id: @notice_queue.to_param, notice_queue: @notice_queue.attributes
    assert_redirected_to notice_queue_path(assigns(:notice_queue))
  end

  test "should destroy notice_queue" do
    assert_difference('NoticeQueue.count', -1) do
      delete :destroy, id: @notice_queue.to_param
    end

    assert_redirected_to notice_queues_path
  end
end
