require 'test_helper'

class FactoriesControllerTest < ActionController::TestCase
  setup do
    @factory = factories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factory" do
    assert_difference('Factory.count') do
      post :create, :factory => @factory.attributes
    end

    assert_redirected_to factory_path(assigns(:factory))
  end

  test "should show factory" do
    get :show, :id => @factory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @factory.to_param
    assert_response :success
  end

  test "should update factory" do
    put :update, :id => @factory.to_param, :factory => @factory.attributes
    assert_redirected_to factory_path(assigns(:factory))
  end

  test "should destroy factory" do
    assert_difference('Factory.count', -1) do
      delete :destroy, :id => @factory.to_param
    end

    assert_redirected_to factories_path
  end
end
