# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'View show', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'for a given list' do
    list = create(:list)

    visit root_path

    click_link list.name

    assert_selector 'h1', text: list.name
  end
end
