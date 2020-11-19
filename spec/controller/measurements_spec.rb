require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, type: :controller do
  let(:user1) { User.create(username: 'asd123', password: 'asd123') }
  let(:measure1) { Measure.create(name: 'test123') }
  let(:measurement1) { user1.measurements.create(value: 123, measure_id: 1) }
  let(:token) { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.RqihBp9h8I4hhpOkeyxUgBcNIHmXr0GjPS-_qXtcuEY' }

  before do
    request.headers['Authorization'] = token
  end

  it 'authorized user can see own data' do
    get :index

    expect(response).to have_http_status(204)
  end
end
