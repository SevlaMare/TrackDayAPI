require 'rails_helper'

RSpec.describe Measure, type: :model do
  let(:measure) { Measure.new }

  it 'exist' do
    expect(measure).not_to be_nil
  end
end
