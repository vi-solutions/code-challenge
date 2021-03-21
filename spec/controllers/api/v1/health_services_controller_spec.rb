# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::HealthServicesController do
  describe 'GET #area_name' do
    context 'when LAT and LNG parameters not within BC' do
      before do
        stub_request(:get, OPENMAPS_URI)
          .with(query: hash_including({}))
          .to_return(status: 200, body: {}.to_json)
      end
      it 'JSON body response contains LAT_LNG_NOT_WITHIN_BC' do
        get 'area_name', params: { lat: '+90.0000', lng: '135.0000' } # geographic north pole
        json_resp = JSON.parse(response.body)
        expect(json_resp.keys).to match_array(['LAT_LNG_NOT_WITHIN_BC'])
      end
    end

    context 'when valid LAT and LNG parameters' do
      before do
        stub_request(:get, OPENMAPS_URI)
          .with(query: hash_including({}))
          .to_return(
            status: 200,
            body: {
              'features': [
                'properties': {
                  'CMNTY_HLTH_SERV_AREA_NAME': 'Cowichan'
                }
              ]
            }.to_json
          )
        get 'area_name', params: { lat: '+48.8277', lng: '-123.711' } # cowichan
      end

      it 'respsonds with JSON body CMNTY_HLTH_SERV_AREA_NAME attribute and appropriate value' do
        json_resp = JSON.parse(response.body)
        expect(json_resp.keys).to match_array(['CMNTY_HLTH_SERV_AREA_NAME'])
        expect(json_resp['CMNTY_HLTH_SERV_AREA_NAME']).to eq('Cowichan')
      end

      it 'should create a HealthServicesApiRequest record' do
        expect(HealthServicesApiRequest.all.count).to eq(1)
      end
    end
  end
end
