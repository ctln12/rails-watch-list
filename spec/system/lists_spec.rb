# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'viewing the homepage' do
    list = create(:list)

    visit root_path

    click_link 'View Lists'

    assert_selector 'h2', text: 'Lists'
    assert_selector 'span', text: list.name
  end

  it 'viewing the show' do
    list = create(:list)

    visit root_path

    click_link list.name

    assert_selector 'h1', text: list.name
  end
end
