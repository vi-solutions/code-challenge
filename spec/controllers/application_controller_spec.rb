# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController do
  describe 'GET #index' do
    before do
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
