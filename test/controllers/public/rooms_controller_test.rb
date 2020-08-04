require 'test_helper'

class Public::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_rooms_show_url
    assert_response :success
  end

end
