require 'test_helper'

class PictureDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get picture_detail_new_url
    assert_response :success
  end

  test "should get create" do
    get picture_detail_create_url
    assert_response :success
  end

end
