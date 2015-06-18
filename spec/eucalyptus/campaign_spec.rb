require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Campaign do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe '#ads' do
    let(:campaign) { Eucalyptus::Campaign.all.last }

    it 'returns a collection of Ad objects which belong to the campaign' do
      VCR.use_cassette("campaign_ads") do
        expect(campaign.ads).to be_a Array
        expect(campaign.ads.first).to be_a Eucalyptus::Ad
      end
    end
  end

  describe '#ad_sets' do
    let(:campaign) { Eucalyptus::Campaign.all.last }

    it 'returns a collection of Ad objects which belong to the campaign' do
      VCR.use_cassette("campaign_ad_sets") do
        expect(campaign.ad_sets).to be_a Array
        expect(campaign.ad_sets.first).to be_a Eucalyptus::AdSet
      end
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
