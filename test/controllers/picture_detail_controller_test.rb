require 'test_helper'

class PictureDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picture_detail_index_url
    assert_response :success
  end

end
