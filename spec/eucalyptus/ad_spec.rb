require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Ad do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe 'returning known fields' do
    let(:ad) { Eucalyptus::Ad.all.last }

    it 'returns an object which responds to available fields' do
      VCR.use_cassette("ad") do
        expect(ad).to respond_to :name
        expect(ad).to respond_to :adgroup_status
      end
    end
  end
end
