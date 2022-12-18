require "test_helper"

class Lab12ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lab12_input_url
    assert_response :success
  end

  test "should get show" do
    get lab12_show_url
    assert_response :success
  end
end
