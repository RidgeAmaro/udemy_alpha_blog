require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "Sign up as a new user" do
    get "/signup"
    assert_response :success

    post users_path, params: { user: { username: "Test", email: "Test@test.com", password: "password"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Test", response.body
  end
end
