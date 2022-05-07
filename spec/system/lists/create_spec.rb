# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create list', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'successfully with name and image' do
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

  scenario 'with invalid name and image' do
    list = create(:list)
    list_nb = List.count

    visit root_path
    click_link 'Create List'
    expect(page).to have_current_path(new_list_path)

    fill_in 'Name', with: list.name
    click_button 'Create List'

    expect(page).to have_content('Name has already been taken')
    expect(page).to have_content("Image can't be blank")
    expect(List.count).to eq(list_nb)
  end
end
