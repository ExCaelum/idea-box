require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:body)
end
