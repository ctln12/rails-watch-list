# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'View show', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:list) { create(:list) }

  scenario 'for a given list' do
    visit root_path

    click_link list.name

    assert_selector 'h1', text: list.name
  end
end
