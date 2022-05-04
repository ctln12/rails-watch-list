# frozen_string_literal: true

class List < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
end
