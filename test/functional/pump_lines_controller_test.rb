require 'test_helper'

class PumpLinesControllerTest < ActionController::TestCase
  setup do
    @pump_line = pump_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pump_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pump_line" do
    assert_difference('PumpLine.count') do
      post :create, :pump_line => @pump_line.attributes
    end

    assert_redirected_to pump_line_path(assigns(:pump_line))
  end

  test "should show pump_line" do
    get :show, :id => @pump_line.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pump_line.to_param
    assert_response :success
  end

  test "should update pump_line" do
    put :update, :id => @pump_line.to_param, :pump_line => @pump_line.attributes
    assert_redirected_to pump_line_path(assigns(:pump_line))
  end

  test "should destroy pump_line" do
    assert_difference('PumpLine.count', -1) do
      delete :destroy, :id => @pump_line.to_param
    end

    assert_redirected_to pump_lines_path
  end
end
