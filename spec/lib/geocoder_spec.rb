require './spec/spec_helper'

RSpec.describe Geocoder do
  subject { described_class }

  describe '.geocode' do
    context 'existing city' do
      it 'returns coordinates' do
        result = subject.geocode('Адыгейск')

        expect(result).to eq([44.878414, 39.190289])
      end
    end

    context 'missing city' do
      it 'returns a nil value' do
        result = subject.geocode('Missing')

        expect(result).to be_nil
      end
    end
  end
end
