require 'rails_helper'

RSpec.describe 'Health endpoint', type: :request do
  describe 'GET /health' do
    before { get '/health' }

    it 'should respond with an ok status' do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload['status']).to eq('OK')
    end

    it 'should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'should allow cors access for localhost' do
      headers = response.headers
      allow_origin = headers['Access-Control-Allow-Origin']

      expect(allow_origin).not_to be_empty
      expect(allow_origin).to eq('localhost')
    end
  end
end
