# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'associations' do
    subject!(:movie) { create(:movie) }

    it { should have_many :bookmarks }
    it { should have_many(:lists).through(:bookmarks) }
  end

  describe 'validations' do
    subject!(:movie) { create(:movie) }

    it { should validate_presence_of :title }
    it { should validate_presence_of :overview }

    it { should validate_uniqueness_of :title }

    it { should allow_value('https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg').for :poster_url }
    it { should_not allow_value('/kqjL17yufvn9OVLyXYpvtyrFfak.jpg').for :poster_url }

    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to 0.0 }
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to 10.0 }
  end
end
