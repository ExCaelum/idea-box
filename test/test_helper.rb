ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/initializers"
  add_filter "/environment"
end
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require "mocha/mini_test"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
