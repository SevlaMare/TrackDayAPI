require 'rails_helper'

RSpec.describe Measurement, type: :model do
  # it { should belong_to(:user) }
  # it { should belong_to(:measure) }

  let(:measurement) { Measurement.new }
  let(:user1) { User.create(username: 'abc123', password: 'abc123') }
  let(:measure1) { Measure.create(name: 'test123') }
  let(:measurement1) { user1.measurements.create(value: 123, measure_id: 1) }

  it 'exist' do
    expect(measurement).not_to be_nil
  end

  it 'has an owner' do
    user1
    measure1
    measurement1
    expect(Measurement.first.user).not_to be_nil
  end

  it 'associate with a measure' do
    user1
    measure1
    measurement1
    expect(Measurement.first.measure).not_to be_nil
  end
end