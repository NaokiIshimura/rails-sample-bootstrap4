require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get form_input_url
    assert_response :success
  end

  test "should get output" do
    get form_output_url
    assert_response :success
  end

end
