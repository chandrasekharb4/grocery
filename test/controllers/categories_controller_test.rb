require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_index_url
    assert_response :success
  end

  test "should get add" do
    get categories_add_url
    assert_response :success
  end

  test "should get categories-admin" do
    get categories_categories-admin_url
    assert_response :success
  end

end
