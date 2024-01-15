require 'rails_helper'

RSpec.describe 'Homepages', type: :request do
  describe 'GET /hello' do
    it 'returns http success' do
      get '/homepage/hello'
      expect(response).to have_http_status(:success)
    end
  end
end
