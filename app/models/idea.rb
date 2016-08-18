class Idea < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  enum quality: %w(swill plausible genius)

  def upvote
    if self.quality == "genius"
      self
    elsif self.quality == "plausible"
      self.quality = "genius"
    else
      self.quality = "plausible"
    end
    self.save
    self
  end

end
