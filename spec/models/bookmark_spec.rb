# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:list) }
  end

  describe 'validations' do
    subject(:bookmark) { create(:bookmark) }

    it { should validate_length_of(:comment).is_at_least(6) }
    it { should validate_uniqueness_of(:movie_id).scoped_to(:list_id) }
  end
end
