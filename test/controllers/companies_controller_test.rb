require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get companies_name:string_url
    assert_response :success
  end

end
