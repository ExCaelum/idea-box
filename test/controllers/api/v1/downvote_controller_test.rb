require 'test_helper'

class Api::V1::UpvoteControllerTest < ActionDispatch::IntegrationTest
  test "decrease quality" do
    patch "/api/v1/ideas/#{ideas(:two).id}/downvote"

    assert_response :success
    idea = JSON.parse(response.body)

    assert_equal "swill", idea["quality"]
  end
end
