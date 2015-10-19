require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Account do
  let(:account) { Eucalyptus::Account.all.last }

  describe '#insights' do
    it 'returns an array of insights for the account' do
      VCR.use_cassette("account_insights") do
        expect(account.insights).to be_a Eucalyptus::ResponseCollection
        expect(account.insights.first).to be_a Eucalyptus::Insight
      end
    end
  end

  describe '#ads' do
    it 'returns a collection of Ad objects which belong to the account' do
      VCR.use_cassette("account_ads") do
        expect(account.ads).to be_a Eucalyptus::ResponseCollection
        expect(account.ads.first).to be_a Eucalyptus::Ad
      end
    end
  end

  describe '#ad_sets' do
    it 'returns a collection of AdSet objects which belong to the account' do
      VCR.use_cassette("account_ad_sets") do
        expect(account.ad_sets).to be_a Eucalyptus::ResponseCollection
        expect(account.ad_sets.first).to be_a Eucalyptus::AdSet
      end
    end
  end

  describe '#campaigns' do
    it 'returns a collection of Campaign objects which belong to the account' do
      VCR.use_cassette("account_campaigns") do
        expect(account.campaigns).to be_a Eucalyptus::ResponseCollection
        expect(account.campaigns.first).to be_a Eucalyptus::Campaign
      end
    end
  end
end
