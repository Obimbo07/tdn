require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = User.create(name: 'Austin ')
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Elements for users' do
    it 'render the template of post index' do
      get '/users'
      expect(response.body).to render_template('index')
      expect(response.body).to include('<h1>Show all users</h1>')
    end

    it 'render the show template for post' do
      user = User.create(name: 'Austin', id: '1')
      get user_path(user)
      expect(response.body).to render_template('show')
      expect(response.body).to include('<h1>Show individual users</h1>')
    end
  end
end
