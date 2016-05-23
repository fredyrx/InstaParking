require 'test_helper'

class RentarControllerTest < ActionController::TestCase
  test "should get pagar" do
    get :pagar
    assert_response :success
  end

end
