FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    sequence(:email) {|n| "#{n}-#{ Faker::Internet.email}"}
    password { Faker::Internet.password(12) }
  end
end