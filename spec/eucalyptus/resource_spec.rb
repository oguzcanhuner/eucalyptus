require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Resource do
  describe ".find" do
    let(:graph) { double(:graph, get_object: { "id" => "123" }) }

    it 'returns an instance of Resource' do
      expect( Eucalyptus::Resource.find(123, graph: graph) ).to be_a Eucalyptus::Resource
    end

    it 'takes an id and returns an object which returns that id' do
      audience = Eucalyptus::Resource.find(123, graph: graph) 
      expect(audience.id).to eql "123"
    end
  end
end
