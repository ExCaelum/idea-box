class Idea < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  enum quality: %w(swill plausible genius)

  def upvote
    update(quality: quality_before_type_cast + 1) unless quality == "genius"
    self
  end

  def downvote
    update(quality: quality_before_type_cast - 1)  unless quality == "swill"
    self
  end

end
