require 'test_helper'

class CustomerSupportsControllerTest < ActionController::TestCase
  setup do
    @customer_support = customer_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_support" do
    assert_difference('CustomerSupport.count') do
      post :create, customer_support: { name: @customer_support.name, username: @customer_support.username }
    end

    assert_redirected_to customer_support_path(assigns(:customer_support))
  end

  test "should show customer_support" do
    get :show, id: @customer_support
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_support
    assert_response :success
  end

  test "should update customer_support" do
    put :update, id: @customer_support, customer_support: { name: @customer_support.name, username: @customer_support.username }
    assert_redirected_to customer_support_path(assigns(:customer_support))
  end

  test "should destroy customer_support" do
    assert_difference('CustomerSupport.count', -1) do
      delete :destroy, id: @customer_support
    end

    assert_redirected_to customer_supports_path
  end
end
