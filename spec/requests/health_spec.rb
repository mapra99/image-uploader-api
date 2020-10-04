require 'rails_helper'

RSpec.describe 'Health endpoint', type: :request do
  describe 'GET /health' do
    before {get '/health'}

    it 'should respond with an ok status' do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload['status']).to eq('OK')
    end

    it 'should return 200 status code' do
      expect(response.status).to eq(200)
    end
  end
end
