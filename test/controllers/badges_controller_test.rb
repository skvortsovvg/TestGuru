require "test_helper"

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badges_index_url
    assert_response :success
  end

  test "should get new" do
    get badges_new_url
    assert_response :success
  end

  test "should get show" do
    get badges_show_url
    assert_response :success
  end

  test "should get create" do
    get badges_create_url
    assert_response :success
  end
end
