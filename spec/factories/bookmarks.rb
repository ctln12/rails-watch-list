# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    comment { Faker::Lorem.paragraph }
    association :movie
    association :list
  end
end
