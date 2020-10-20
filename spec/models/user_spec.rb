require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  let(:user1) { User.create(name: 'first', email: 'first@email.com', password: 'abc123') }
  let(:user2) { User.create(name: 'second', email: 'second@email.com', password: 'abc123') }
  let(:measurement1) { user1.measurements.create(friend_id: 2) }
  # let(:post1) { user1.posts.create(content: 'abc') }

  context 'Model' do
    it 'exist' do
      expect(user).not_to be_nil
    end

    it 'create a user' do
      user1
      expect(User.first.name).not_to be_nil
    end
  end
end
