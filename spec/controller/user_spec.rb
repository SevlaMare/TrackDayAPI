require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user1) { User.create(username: 'user01') }

  it 'create a user' do
    post :create, params: { username: 'asd123', password: '123456' }
    expect(response).to have_http_status(200)
  end

  it 'unauthorized' do
    post :create, params: { username: 'zx', password: '123456' }
    expect(response).to have_http_status(401)
  end

  it 'receive token' do
    post :create, params: { username: 'asd123', password: '123456' }
    data = JSON.parse(response.body)

    expect(data['token']).not_to be_nil
  end
end