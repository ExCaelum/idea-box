class Seed

  def initialize
    create_ideas
  end

  def create_ideas
    50.times do
      Idea.create!(
        title: Faker::Hipster.word,
        body: Faker::Hipster.paragraph
      )
    end
  end

end

Seed.new
