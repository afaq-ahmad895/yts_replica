require 'test_helper'

class YtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yts_index_url
    assert_response :success
  end

end
