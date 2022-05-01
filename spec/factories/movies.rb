# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    overview { Faker::Movie.quote }
    poster_url { 'https://www.seoclerk.com/pics/569323-1bpEHf1510684912.jpg' }
    rating { 5.0 }
  end
end
