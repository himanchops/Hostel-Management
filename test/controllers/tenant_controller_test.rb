require 'test_helper'

class TenantControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tenant_show_url
    assert_response :success
  end

end
