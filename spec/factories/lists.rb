# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Book.genre }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/files/image.jpg'), 'image/jpeg') }
  end
end
