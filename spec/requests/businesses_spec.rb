require 'rails_helper'

RSpec.describe 'Businesses API', type: :request do
  let!(:business) { create(:business) }

  describe 'GET /businesses' do
    before { get '/businesses' }

    it 'returns businesses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /businesses/:id' do
    context 'when the record exists' do
      before { get "/businesses/#{business.id}" }

      it 'returns the business' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(business.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/businesses/100' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Business/)
      end
    end
  end

  describe 'POST /businesses' do
    let(:valid_attributes) { { name: 'Foobar', email: 'user@example.com', phone: '555-555-5555', website: 'https://www.example.com' } }

    context 'when the request is valid' do
      before { post '/businesses', params: valid_attributes }

      it 'creates a business' do
        expect(json['name']).to eq('Foobar')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/businesses', params: { title: 'Foobaz' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank, Email can't be blank, Phone can't be blank, Website can't be blank/)
      end
    end
  end

  describe 'PUT /businesses/:id' do
    let(:valid_attributes) { { name: 'Taco Cat' } }

    context 'when the record exists' do
      before { put "/businesses/#{business.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /businesses/:id' do
    before { delete "/businesses/#{business.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
