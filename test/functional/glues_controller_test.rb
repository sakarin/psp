require 'test_helper'

class GluesControllerTest < ActionController::TestCase
  setup do
    @glue = glues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glue" do
    assert_difference('Glue.count') do
      post :create, :glue => @glue.attributes
    end

    assert_redirected_to glue_path(assigns(:glue))
  end

  test "should show glue" do
    get :show, :id => @glue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @glue.to_param
    assert_response :success
  end

  test "should update glue" do
    put :update, :id => @glue.to_param, :glue => @glue.attributes
    assert_redirected_to glue_path(assigns(:glue))
  end

  test "should destroy glue" do
    assert_difference('Glue.count', -1) do
      delete :destroy, :id => @glue.to_param
    end

    assert_redirected_to glues_path
  end
end
