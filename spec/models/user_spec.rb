require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  let(:user1) { User.create(name: 'first', email: 'first@email.com', password: 'abc123') }
  let(:measurement1) { user1.measurements.create(value: 123, measure_id: 1) }

  context 'Model' do
    it 'exist' do
      expect(user).not_to be_nil
    end

    it 'create a user' do
      user1
      expect(User.first.name).not_to be_nil
    end

    it 'create a measurement' do
      user1
      measurement1
      expect(user1.measurements.first).not_to be_nil
    end
  end
end
