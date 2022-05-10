# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BookmarksController', type: :request do
  describe 'GET /lists/:list_id/bookmarks/new' do
    let!(:list) { create :list }

    it 'shows the page to create a new bookmark' do
      get new_list_bookmark_url(list)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include "Add a movie to your #{list.name} list"
    end
  end

  describe 'POST /lists/:list_id/bookmarks', type: :request do
    let!(:list) { create :list }
    let!(:movie) { create :movie }
    let!(:valid_attributes) { attributes_for(:bookmark, movie_id: movie.id) }
    let!(:invalid_attributes) { attributes_for(:bookmark) }

    context 'with valid parameters' do
      it 'creates a new bookmark successfully' do
        expect { post list_bookmarks_url(list), params: { bookmark: valid_attributes } }
          .to change(Bookmark, :count).by(1)
        expect(response).to redirect_to(list_url(list))
        follow_redirect!
        expect(response.body).to include Bookmark.last.movie.title
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new bookmark' do
        expect { post list_bookmarks_url(list), params: { bookmark: invalid_attributes } }
          .to change(Bookmark, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include "Add a movie to your #{list.name} list"
      end
    end
  end
end
