require 'rails_helper'

RSpec.describe 'Images Controller', type: :request do
  describe 'GET /images' do
    before { get '/images', headers: { 'HTTP_ORIGIN' => ENV['PRODUCTION_FRONTEND_URL'] } }

    it 'should allow cors access from production frontend project' do
      headers = response.headers
      allow_origin = headers['Access-Control-Allow-Origin']

      expect(allow_origin).not_to be_empty
      expect(allow_origin).to eq(ENV['PRODUCTION_FRONTEND_URL'])
    end
  end
end
