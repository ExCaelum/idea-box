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

  test "create idea with bad data" do
    post "/api/v1/ideas"

    assert_response :success

    error = JSON.parse(response.body)

    assert_equal "invalid Data", error
  end

  test "delete idea" do
    delete "/api/v1/ideas/#{ideas(:one).id}"

    assert_response :success
    assert_equal 1, Idea.all.count
  end

  test "update idea" do
    patch "/api/v1/ideas/#{ideas(:one).id}?title=new&body=alsonew"

    assert_response :success
    idea = JSON.parse(response.body)

    assert_equal "new", idea["title"]
    assert_equal "alsonew", idea["body"]
  end

end
