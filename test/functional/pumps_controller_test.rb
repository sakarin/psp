require 'test_helper'

class PumpsControllerTest < ActionController::TestCase
  setup do
    @pump = pumps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pumps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pump" do
    assert_difference('Pump.count') do
      post :create, :pump => @pump.attributes
    end

    assert_redirected_to pump_path(assigns(:pump))
  end

  test "should show pump" do
    get :show, :id => @pump.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pump.to_param
    assert_response :success
  end

  test "should update pump" do
    put :update, :id => @pump.to_param, :pump => @pump.attributes
    assert_redirected_to pump_path(assigns(:pump))
  end

  test "should destroy pump" do
    assert_difference('Pump.count', -1) do
      delete :destroy, :id => @pump.to_param
    end

    assert_redirected_to pumps_path
  end
end
