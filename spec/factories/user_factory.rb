FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}-#{Faker::Internet.email}" }
    password 'secret'
    password_confirmation 'secret'
  end
end
