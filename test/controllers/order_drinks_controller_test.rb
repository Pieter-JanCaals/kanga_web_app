require 'test_helper'

class OrderDrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_drinks_create_url
    assert_response :success
  end

end
