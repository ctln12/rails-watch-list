# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    subject(:movie) { create(:movie) }

    it { should validate_presence_of :title }
    it { should validate_presence_of :overview }

    it { should validate_uniqueness_of :title }
  end
end
