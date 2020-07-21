require 'test_helper'

class Corporate::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get corporate_companies_show_url
    assert_response :success
  end

  test "should get edit" do
    get corporate_companies_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get corporate_companies_unsubscribe_url
    assert_response :success
  end

end
