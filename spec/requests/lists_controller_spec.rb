# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ListsController', type: :request do
  describe 'GET /' do
    let!(:list) { create :list }

    it 'shows a list of lists' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include list.name
    end
  end
end
