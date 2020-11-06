require 'rails_helper'

RSpec.describe Api::V1::MeasuresController, type: :controller do
  it 'authorized without token' do
    get :index, format: :json
    expect(response).to have_http_status(200)
  end
end