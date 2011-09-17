require 'test_helper'

class EarsControllerTest < ActionController::TestCase
  setup do
    @ear = ears(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ear" do
    assert_difference('Ear.count') do
      post :create, :ear => @ear.attributes
    end

    assert_redirected_to ear_path(assigns(:ear))
  end

  test "should show ear" do
    get :show, :id => @ear.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ear.to_param
    assert_response :success
  end

  test "should update ear" do
    put :update, :id => @ear.to_param, :ear => @ear.attributes
    assert_redirected_to ear_path(assigns(:ear))
  end

  test "should destroy ear" do
    assert_difference('Ear.count', -1) do
      delete :destroy, :id => @ear.to_param
    end

    assert_redirected_to ears_path
  end
end
