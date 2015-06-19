require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::AdSet do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe '#ads' do
    let(:ad_set) { Eucalyptus::AdSet.all.first }

    it 'returns a collection of Ad objects which belong to the ad_set' do
      VCR.use_cassette("ad_set_ads") do
        expect(ad_set.ads).to be_a Array
        expect(ad_set.ads.first).to be_a Eucalyptus::Ad
      end
    end
  end

  describe 'returning known fields' do
    let(:ad_set) { Eucalyptus::AdSet.all.last }

    it 'returns an object which responds to available fields' do
      VCR.use_cassette("ad_set") do
        expect(ad_set).to respond_to :name
        expect(ad_set).to respond_to :bid_type
      end
    end
  end
end
