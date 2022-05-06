# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ListsController', type: :request do
  describe 'GET /lists' do
    let!(:list) { create :list }

    it 'shows a list of lists' do
      get root_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include list.name
    end
  end

  describe 'GET /lists/:id' do
    let!(:list) { create :list }

    it 'shows the details of a list' do
      get list_url(list)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include list.name
    end
  end
end
