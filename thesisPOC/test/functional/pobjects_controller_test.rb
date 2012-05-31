require 'test_helper'

class PobjectsControllerTest < ActionController::TestCase
  setup do
    @pobject = pobjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pobjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pobject" do
    assert_difference('Pobject.count') do
      post :create, pobject: @pobject.attributes
    end

    assert_redirected_to pobject_path(assigns(:pobject))
  end

  test "should show pobject" do
    get :show, id: @pobject.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pobject.to_param
    assert_response :success
  end

  test "should update pobject" do
    put :update, id: @pobject.to_param, pobject: @pobject.attributes
    assert_redirected_to pobject_path(assigns(:pobject))
  end

  test "should destroy pobject" do
    assert_difference('Pobject.count', -1) do
      delete :destroy, id: @pobject.to_param
    end

    assert_redirected_to pobjects_path
  end
end
