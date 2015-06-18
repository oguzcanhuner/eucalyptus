require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Account do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe '#ads' do
    let(:account) { Eucalyptus::Account.all.last }

    it 'returns a collection of Ad objects which belong to the account' do
      VCR.use_cassette("account_ads") do
        expect(account.ads).to be_a Array
        expect(account.ads.first).to be_a Eucalyptus::Ad
      end
    end
  end

  describe '#ad_sets' do
    let(:account) { Eucalyptus::Account.all.last }

    it 'returns a collection of AdSet objects which belong to the account' do
      VCR.use_cassette("account_ad_sets") do
        expect(account.ad_sets).to be_a Array
        expect(account.ad_sets.first).to be_a Eucalyptus::AdSet
      end
    end
  end

  describe '#campaigns' do
    let(:account) { Eucalyptus::Account.all.last }

    it 'returns a collection of AdSet objects which belong to the account' do
      VCR.use_cassette("account_campaigns") do
        expect(account.campaigns).to be_a Array
        expect(account.campaigns.first).to be_a Eucalyptus::Campaign
      end
    end
  end
end
