require 'test_helper'

class Api::V1::UpvoteControllerTest < ActionDispatch::IntegrationTest
  test "increase quality" do
    patch "/api/v1/ideas/#{ideas(:one).id}/upvote"

    assert_response :success
    idea = JSON.parse(response.body)

    assert_equal "plausible", idea["quality"]
  end
end
