require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  let(:user1) { User.create(username: 'first', password: 'abc123', email: 'first@email.com') }
  let(:user_invalid) { User.new(username: 'first', password: 'asd123') }
  let(:measurement1) { user1.measurements.create(value: 123, measure_id: 1) }

  context 'Model' do
    it 'exist' do
      expect(user).not_to be_nil
    end

    it 'create a valid user' do
      user1
      expect(User.first.username).not_to be_nil
    end

    it 'forbid rewrite user' do
      user1
      user_invalid
      expect(user_invalid.save).to eq(false)
    end

    it 'autofill id using association' do
      user1
      measurement1
      expect(user1.measurements.first).not_to be_nil
    end
  end
end
