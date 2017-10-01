require 'rails_helper'

RSpec.describe 'Authorization', type: :request do
  context 'header without token' do
    it 'return 401' do
      get '/ping', headers: header
      expect(response).to have_http_status(401)
    end
  end

  context 'header with token' do
    it 'return 200' do
      get '/ping', headers: header_with_token
      expect(response).to have_http_status(200)
    end
  end
end
