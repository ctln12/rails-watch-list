# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'View homepage', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'with all lists' do
    list = create(:list)

    visit root_path

    click_link 'View Lists'

    assert_selector 'h2', text: 'Lists'
    assert_selector 'span', text: list.name
  end
end
