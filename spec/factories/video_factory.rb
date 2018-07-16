FactoryGirl.define do
  factory :video do
    title Faker::Hacker.ingverb
    caption Faker::Hacker.say_something_smart
    url Faker::Internet.url('youtube.com', '/watch?v=xecEV4dSAXE')
  end
end
