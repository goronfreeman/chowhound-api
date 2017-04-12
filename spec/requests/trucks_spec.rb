require 'rails_helper'

RSpec.describe 'Trucks API', type: :request do
  let!(:business) { create(:business) }
  let!(:truck) { create(:truck, business_id: business.id) }

  describe 'GET /trucks' do
    before { get '/trucks' }

    it 'returns trucks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /trucks/:id' do
    context 'when the record exists' do
      before { get "/trucks/#{truck.id}" }

      it 'returns the truck' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(truck.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/trucks/100' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Truck/)
      end
    end
  end

  describe 'POST /trucks' do
    let(:valid_attributes) { { name: 'Foobar', description: 'Lorem ipsum.', business_id: business.id } }

    context 'when the request is valid' do
      before { post '/trucks', params: valid_attributes }

      it 'creates a truck' do
        expect(json['name']).to eq('Foobar')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/trucks', params: { name: 'Foobaz' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Business must exist, Description can't be blank/)
      end
    end
  end

  describe 'PUT /trucks/:id' do
    let(:valid_attributes) { { name: 'Taco Cat' } }

    context 'when the record exists' do
      before { put "/trucks/#{truck.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /trucks/:id' do
    before { delete "/trucks/#{truck.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
