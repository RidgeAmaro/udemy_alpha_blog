require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "Test Admin", email: "test@admin.com", password: "password")
    sign_in_as(@user)
  end

  test "create new article as user" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "Sports are fun", description: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTest", category_id: 2} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports are fun", response.body
  end

end
