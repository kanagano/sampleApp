FactoryBot.define do
  factory :user, aliases: [:writer, :owner, :visitor, :visited] do
    name "Landy"
    sequence(:email) { |n| "test#{n}@example.com" }
    password "test1234"
  end
end
