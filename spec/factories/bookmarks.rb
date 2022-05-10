# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    comment { Faker::Lorem.paragraph }
    association :movie, factory: :movie
    association :list, factory: :list
  end
end
