require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::CustomAudience do
  describe '.create' do
    it 'creats a new custom audience' do
      VCR.use_cassette('create_audience') do
        audience = Eucalyptus::CustomAudience.create(name: "oz-test")
      end
    end
  end

  describe '#populate' do
    it 'populates an audience with a list of emails' do
      VCR.use_cassette('populate_audience') do
        audience = Eucalyptus::CustomAudience.create(name: "oz-test")
        audience.populate(["oz@lostmy.name","dev@lostmy.name"])
        audience.delete
      end
    end
  end

  describe '#remove' do
    it 'populates an audience with a list of emails' do
      VCR.use_cassette('populate_audience') do
        audience = Eucalyptus::CustomAudience.create(name: "oz-test")
        audience.populate(["oz@lostmy.name","dev@lostmy.name"])
        audience.remove(["oz@lostmy.name","dev@lostmy.name"])
        audience.delete
      end
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
