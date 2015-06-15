require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::CustomAudience do
  describe ".find" do
    let(:graph) { double(:graph, get_object: { "id" => "123" }) }

    it 'returns an instance of CustomAudience' do
      expect( Eucalyptus::CustomAudience.find(123) ).to be_a Eucalyptus::CustomAudience
    end

    it 'takes an id and returns an object which returns that id' do
      audience = Eucalyptus::CustomAudience.find(123, graph: graph) 
      expect(audience.id).to eql "123"
    end
  end
end
