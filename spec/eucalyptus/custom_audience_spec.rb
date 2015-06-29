require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::CustomAudience do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

  describe '#ad_sets' do
    it 'returns ad_sets which belong to the audience' do
      VCR.use_cassette('audience_ad_sets') do
        audience = Eucalyptus::CustomAudience.all.first
        ad_sets = audience.ad_sets
        expect(ad_sets.first.targeting.custom_audiences.first['id']).to eql audience.id
      end
    end
  end
end
