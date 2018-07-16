FactoryGirl.define do
  factory :blog_post_attachment do
    title Faker::Hipster.sentence
    caption Faker::Hacker.say_something_smart
    url Faker::Internet.url
    media_type 'Image'

    trait :video do
      media_type 'Video'
    end
  end
end
