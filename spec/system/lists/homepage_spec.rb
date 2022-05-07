# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'View homepage', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:lists) { [create(:list), create(:list)] }

  scenario 'with all lists' do
    visit root_path

    click_link 'View Lists'

    assert_selector 'h2', text: 'Lists'
    assert_selector 'span', text: lists[0].name
    assert_selector 'span', text: lists[1].name
  end
end
