FactoryBot.define do
  factory :user, aliases: [:writer, :owner, :visitor, :visited] do
    sequence(:name) { |n| "user no.#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "test#{n}password" }
  end
end
