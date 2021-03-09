FactoryBot.define do
  factory :user do
    name              { Faker::Internet.user_name }
    email                 { Faker::Internet.free_email }
    password              { 'abcd123' }
    password_confirmation { password }
  end
end
