class Idea < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  enum quality: %w(swill plausible genius)
end
