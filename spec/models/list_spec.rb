# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    subject!(:list) { create(:list) }

    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }

    it { should have_one_attached(:image) }
    it { should validate_presence_of :image }
  end
end
