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

  it 'creating a new list successfully' do
    list = build(:list)

    visit root_path
    click_link 'Create List'
    expect(page).to have_current_path(new_list_path)

    fill_in 'Name', with: list.name
    attach_file('Image', Rails.root.join('spec/files/image.jpg'))
    click_button 'Create List'

    expect(page).to have_current_path(list_path(List.last))
    assert_selector 'h1', text: list.name
  end
end
