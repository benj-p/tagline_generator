FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n}@gpt-demo.com" }
    password { "abcDEF123" }
  end
end
