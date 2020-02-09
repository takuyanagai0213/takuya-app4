require 'test_helper'

class PictureDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get picture_details_new_url
    assert_response :success
  end

  test "should get create" do
    get picture_details_create_url
    assert_response :success
  end

end
