require 'test_helper'

class ProgrammeControllerTest < ActionController::TestCase
  test "should get newp" do
    get :newp
    assert_response :success
  end

end
