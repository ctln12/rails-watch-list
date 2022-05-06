# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List', type: :system do
  before do
    @list = create(:list)
  end

  it 'displays the details of a list' do
    visit root_path
    click_link @list.name
    assert_selector 'h1', text: @list.name
  end
end
