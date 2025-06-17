require "test_helper"

class MyHandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_hands_index_url
    assert_response :success
  end

  test "should get show" do
    get my_hands_show_url
    assert_response :success
  end
end
