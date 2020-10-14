require 'rails_helper'

RSpec.describe 'Health endpoint', type: :request do
  describe 'GET /health' do
    before { get '/health', headers: { 'HTTP_ORIGIN' => ENV['PRODUCTION_FRONTEND_URL'] } }

    it 'should respond with an ok status' do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload['status']).to eq('OK')
    end

    it 'should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'should allow cors access from production frontend project' do
      headers = response.headers
      allow_origin = headers['Access-Control-Allow-Origin']

      expect(allow_origin).not_to be_empty
      expect(allow_origin).to eq(ENV['PRODUCTION_FRONTEND_URL'])
    end
  end
end
