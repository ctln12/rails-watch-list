# frozen_string_literal: true

class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :overview
  validates_uniqueness_of :title
  validates_format_of :poster_url, with: %r{https://image.tmdb.org/t/p/\w+/\w+\.jpg}
end
