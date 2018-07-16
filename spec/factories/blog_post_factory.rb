FactoryGirl.define do
  factory :blog_post do
    sequence(:title) { Faker::StarWars.quote }
    body Faker::Hipster.paragraphs(10)
    association :author, factory: :user
  end
end
