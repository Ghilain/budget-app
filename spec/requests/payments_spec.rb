require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  describe 'Entities' do
    it 'returns http success' do
      get entities_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /entities' do
    it 'returns http success' do
      get entities_path
      expect(response).to have_http_status(302)
    end
  end
end
