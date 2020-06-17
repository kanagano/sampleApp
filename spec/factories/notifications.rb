FactoryBot.define do
  factory :notification do
    action "like"
    association :post
    visited {post.writer}
    association :visitor
  end
end
