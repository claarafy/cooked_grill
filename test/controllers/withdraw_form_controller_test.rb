require 'test_helper'

class WithdrawFormControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get withdraw_form_new_url
    assert_response :success
  end

  test "should get create" do
    get withdraw_form_create_url
    assert_response :success
  end

end
