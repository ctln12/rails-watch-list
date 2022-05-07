# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates_presence_of :title
  validates_presence_of :overview
  validates_uniqueness_of :title
  validates_format_of :poster_url, with: %r{\Ahttps://image.tmdb.org/t/p/\w+/\w+\.jpg\z}
  validates_numericality_of :rating, greater_than_or_equal_to: 0.0
  validates_numericality_of :rating, less_than_or_equal_to: 10.0
end
