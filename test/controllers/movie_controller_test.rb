require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get inedx" do
    get movie_inedx_url
    assert_response :success
  end

end
