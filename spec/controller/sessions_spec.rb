require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  let(:user1) { User.create(username: 'first', password: '123456') }

  it 'valid user receive token' do
    user1
    post :create, params: { username: 'first', password: '123456' }
    data = JSON.parse(response.body)

    expect(data['token']).not_to be_nil
  end

  it 'unauthorized with wrong credentials' do
    post :create, params: { username: 'first2', password: '123456' }

    expect(response).to have_http_status(401)
  end
end
