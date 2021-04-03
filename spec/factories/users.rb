# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(domain: 'gmail') }
    password { Faker::Internet.password(min_length: 8, max_length: 8) }

    trait :admin do
      role { :admin }
    end

    factory :admin, traits: %i[admin]
  end
end
