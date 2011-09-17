require 'test_helper'

class CoatsControllerTest < ActionController::TestCase
  setup do
    @coat = coats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coat" do
    assert_difference('Coat.count') do
      post :create, :coat => @coat.attributes
    end

    assert_redirected_to coat_path(assigns(:coat))
  end

  test "should show coat" do
    get :show, :id => @coat.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coat.to_param
    assert_response :success
  end

  test "should update coat" do
    put :update, :id => @coat.to_param, :coat => @coat.attributes
    assert_redirected_to coat_path(assigns(:coat))
  end

  test "should destroy coat" do
    assert_difference('Coat.count', -1) do
      delete :destroy, :id => @coat.to_param
    end

    assert_redirected_to coats_path
  end
end
