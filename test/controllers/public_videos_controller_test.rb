require 'test_helper'

class PublicVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_videos_show_url
    assert_response :success
  end

end
