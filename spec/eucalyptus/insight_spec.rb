require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Insight do
  describe '.known_fields' do
    it 'returns an object which responds to available fields' do
      VCR.use_cassette('account_insights') do
        account = Eucalyptus::Account.all.last
        insights = account.insights.first

        expect(insights).to respond_to :clicks
        expect(insights).to respond_to :cpc
      end
    end
  end
end
