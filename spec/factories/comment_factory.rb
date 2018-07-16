FactoryGirl.define do
  factory :comment do
    body Faker::HarryPotter.quote
    association :commenter, factory: :user, strategy: :create
    association :parent, factory: :blog_post, strategy: :create
  end
end
