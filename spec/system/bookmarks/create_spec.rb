# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create bookmark', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'successfully with a comment, a movie and a list' do
    bookmark = build(:bookmark)

    visit root_path
    click_link List.first.name
    expect(page).to have_current_path(list_path(List.first))

    click_link 'Add a movie'
    expect(page).to have_current_path(new_list_bookmark_path(List.first))

    select Movie.first.title, from: 'bookmark_movie_id'
    fill_in 'Comment', with: bookmark.comment
    click_button 'Add Movie'

    expect(page).to have_current_path(list_path(List.first))
    assert_selector 'li', text: Movie.first.title
  end

  scenario 'with invalid comment, movie or list' do
    visit root_path
    click_link List.first.name
    expect(page).to have_current_path(list_path(List.first))

    click_link 'Add a movie'
    expect(page).to have_current_path(new_list_bookmark_path(List.first))

    click_button 'Add Movie'

    expect(page).to have_content('Movie must exist')
    expect(page).to have_content('Comment is too short (minimum is 6 characters)')
  end
end
