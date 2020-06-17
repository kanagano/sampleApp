FactoryBot.define do
  factory :post do
    content "Good location"
    star 3
    association :writer
    association :target
  end
end
