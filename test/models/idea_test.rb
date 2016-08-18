require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:body)

  test "genius upvote returns genius" do
    idea = Idea.create(title: "Idea", body: "This is an Idea", quality: 2)
    assert_equal "genius", idea.quality
    idea = idea.upvote
    assert_equal "genius", idea.quality
  end

  test "plausible upvote returns genius" do
    idea = Idea.create(title: "Idea", body: "This is an Idea", quality: 1)
    assert_equal "plausible", idea.quality
    idea = idea.upvote
    assert_equal "genius", idea.quality
  end

  test "swill upvote returns plausible" do
    idea = Idea.create(title: "Idea", body: "This is an Idea")
    assert_equal "swill", idea.quality
    idea = idea.upvote
    assert_equal "plausible", idea.quality
  end

  test "swill downvote returns swill" do
    idea = Idea.create(title: "Idea", body: "This is an idea")
    assert_equal "swill", idea.quality
    idea = idea.downvote
    assert_equal "swill", idea.quality
  end

  test "plausible downvote returns swill" do
    idea = Idea.create(title: "Idea", body: "This is an idea", quality: 1)
    assert_equal "plausible", idea.quality
    idea = idea.downvote
    assert_equal "swill", idea.quality
  end

  test "genius downvote returns plausible" do
    idea = Idea.create(title: "Idea", body: "This is an idea", quality: 2)
    assert_equal "genius", idea.quality
    idea = idea.downvote
    assert_equal "plausible", idea.quality
  end
end
