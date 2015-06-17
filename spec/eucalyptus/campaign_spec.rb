require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Campaign do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe 'returning known fields' do
    let(:campaign) { Eucalyptus::Campaign.all.last }

    it 'returns an object which responds to available fields' do
      VCR.use_cassette("campaign") do
        expect(campaign).to respond_to :name
      end
    end
  end
end
