FactoryBot.define do
  factory :post do
    title { 'りんご' }
    body { Faker::Lorem.sentence }
    user_id { Faker::Number.between(300, 9_999_999) }
    category_id { '3' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
