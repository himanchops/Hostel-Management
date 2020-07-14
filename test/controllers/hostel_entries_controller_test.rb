require 'test_helper'

class HostelEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get hostel_entries_create_url
    assert_response :success
  end

  test "should get update" do
    get hostel_entries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hostel_entries_destroy_url
    assert_response :success
  end

end
