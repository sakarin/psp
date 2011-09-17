require 'test_helper'

class MouthsControllerTest < ActionController::TestCase
  setup do
    @mouth = mouths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mouths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mouth" do
    assert_difference('Mouth.count') do
      post :create, :mouth => @mouth.attributes
    end

    assert_redirected_to mouth_path(assigns(:mouth))
  end

  test "should show mouth" do
    get :show, :id => @mouth.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mouth.to_param
    assert_response :success
  end

  test "should update mouth" do
    put :update, :id => @mouth.to_param, :mouth => @mouth.attributes
    assert_redirected_to mouth_path(assigns(:mouth))
  end

  test "should destroy mouth" do
    assert_difference('Mouth.count', -1) do
      delete :destroy, :id => @mouth.to_param
    end

    assert_redirected_to mouths_path
  end
end
