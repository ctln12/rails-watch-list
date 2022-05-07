# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    comment { 'MyString' }
    movie { nil }
    list { nil }
  end
end
