FactoryBot.define do
  factory :museum, aliases: [:target] do
    sequence(:name) { |n| "Museum no.#{n}" }
    location "長野県長野市箱清水１丁目４−４"
    introduction "長野県信濃美術館・東山魁夷館は、長野県長野市にある県立美術館。"
    image_name "shinano.jpg"
    opening_time "9:00~17:00"
    closing_day "水曜日"
  end
end
