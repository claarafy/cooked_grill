require 'test_helper'

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test "should get about_cook" do
    get abouts_about_cook_url
    assert_response :success
  end

  test "should get about_delivery" do
    get abouts_about_delivery_url
    assert_response :success
  end

  test "should get about_health" do
    get abouts_about_health_url
    assert_response :success
  end

  test "should get about_payment" do
    get abouts_about_payment_url
    assert_response :success
  end

end
