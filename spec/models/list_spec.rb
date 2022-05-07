# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'associations' do
    subject!(:list) { create(:list) }

    it { should have_many(:bookmarks).dependent(:destroy) }
    it { should have_many(:movies).through(:bookmarks) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    subject!(:list) { create(:list) }

    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :image }
  end
end
