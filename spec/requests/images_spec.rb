require 'rails_helper'

RSpec.describe 'Images Controller', type: :request do
  let(:valid_image_file) { create(:image_file) }

  context 'POST /images' do
    describe 'when uploading valid file image' do
      let(:request_params) { {'image' => valid_image_file.url} }
      before {post '/images', params: request_params}

      it 'should contain the url of the uploaded image' do
        payload = JSON.parse(response.body)
        expect(payload['url']).not_to be_empty
      end

      it 'should return 200 status code' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
