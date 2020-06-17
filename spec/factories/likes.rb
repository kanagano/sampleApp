FactoryBot.define do
  factory :like do
    association :post
    association :owner
  end
end
