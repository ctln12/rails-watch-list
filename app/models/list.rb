# frozen_string_literal: true

class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :image

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :image
end
