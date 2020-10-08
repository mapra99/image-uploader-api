require 'rails_helper'

RSpec.describe 'Images Controller', type: :request do
  describe 'GET /images' do
    before { get '/images' }

    it 'should allow cors access for localhost' do
      headers = response.headers
      allow_origin = headers['Access-Control-Allow-Origin']
  
      expect(allow_origin).not_to be_empty
      expect(allow_origin).to eq('http://localhost:3000')
    end
  end
end
