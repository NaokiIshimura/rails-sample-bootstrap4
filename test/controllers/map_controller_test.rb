require 'test_helper'

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get sample" do
    get map_sample_url
    assert_response :success
  end

end
