require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get film" do
    get movies_film_url
    assert_response :success
  end

end
