require 'test_helper'

class Corporate::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get corporate_rooms_show_url
    assert_response :success
  end

end
