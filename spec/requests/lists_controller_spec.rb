# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ListsController', type: :request do
  describe 'GET /lists' do
    let!(:lists) { [create(:list), create(:list)] }

    it 'shows all the lists' do
      get root_url

      expect(response).to have_http_status(:ok)
      expect(response.body).to include lists[0].name
      expect(response.body).to include lists[1].name
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

  describe 'GET /lists/new' do
    it 'shows the page to create a new list' do
      get new_list_url

      expect(response).to have_http_status(:ok)
      expect(response.body).to include 'Add a new list'
    end
  end

  describe 'POST /lists' do
    let!(:valid_attributes) { attributes_for(:list) }
    let!(:invalid_attributes) { attributes_for(:list, name: nil, image: nil) }

    context 'with valid parameters' do
      it 'creates a new list successfully' do
        expect { post lists_url, params: { list: valid_attributes } }.to change(List, :count).by(1)
        expect(response).to redirect_to(list_url(List.last))
        follow_redirect!
        expect(response.body).to include List.last.name
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new list' do
        expect { post lists_url, params: { list: invalid_attributes } }.to change(List, :count).by(0)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include 'Add a new list'
      end
    end
  end
end
