require 'test_helper'

class Api::V1::IdeasControllerTest < ActionDispatch::IntegrationTest
  test "fetch ideas" do
    get "/api/v1/ideas"

    assert_response :success

    ideas = JSON.parse(response.body)

    assert_equal 2, ideas.count
    assert_equal "First Idea", ideas.first["title"]
    assert_equal "This is the first idea Ive had", ideas.first["body"]
    assert_equal "swill", ideas.first["quality"]
  end

  test "create idea" do
    post "/api/v1/ideas?title=new&body=newidea"

    assert_response :success

    idea = JSON.parse(response.body)

    assert_equal 3, Idea.all.count
    assert_equal "new", idea["title"]
    assert_equal "newidea", idea["body"]
  end

end
