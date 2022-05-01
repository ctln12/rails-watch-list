# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'MyString' }
    overview { 'MyText' }
    poster_url { 'MyString' }
    rating { 1.5 }
  end
end
