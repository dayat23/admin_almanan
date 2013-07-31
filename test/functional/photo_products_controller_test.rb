require 'test_helper'

class PhotoProductsControllerTest < ActionController::TestCase
  setup do
    @photo_product = photo_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_product" do
    assert_difference('PhotoProduct.count') do
      post :create, photo_product: { description: @photo_product.description, image_product: @photo_product.image_product, product_id: @photo_product.product_id }
    end

    assert_redirected_to photo_product_path(assigns(:photo_product))
  end

  test "should show photo_product" do
    get :show, id: @photo_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_product
    assert_response :success
  end

  test "should update photo_product" do
    put :update, id: @photo_product, photo_product: { description: @photo_product.description, image_product: @photo_product.image_product, product_id: @photo_product.product_id }
    assert_redirected_to photo_product_path(assigns(:photo_product))
  end

  test "should destroy photo_product" do
    assert_difference('PhotoProduct.count', -1) do
      delete :destroy, id: @photo_product
    end

    assert_redirected_to photo_products_path
  end
end
