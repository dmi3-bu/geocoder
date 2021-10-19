require './spec/spec_helper'

RSpec.describe 'Geocode API', type: :request do
  describe 'POST /geocode' do
    context 'missing parameters' do
      it 'returns an error' do
        status, _headers, _body = json_request('/geocode', 'POST', params: {})

        expect(status).to eq(422)
      end
    end

    context 'invalid city' do
      it 'returns an error' do
        status, _headers, body = json_request('/geocode', 'POST', params: { city: 'Springfield' })

        expect(status).to eq(422)
        expect(JSON(body.first)['errors']).to include(
          {
            'detail' => 'City not found'
          }
        )
      end
    end

    context 'valid parameters' do
      it 'returns found city' do
        status, _headers, body = json_request('/geocode', 'POST', params: { city: 'Адыгейск' })

        expect(status).to eq(200)
        expect(JSON(body.first)['coords']).to eq({ 'lat' => 44.878414, 'lon' => 39.190289 })
      end
    end
  end
end
