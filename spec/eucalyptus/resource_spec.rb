require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Resource do

  context "given a class which inherits from Eucalyptus::Resource" do
    describe ".find" do
      let(:graph) { double(:graph, get_object: { "id" => "123" }) }

      it 'returns an instance of Resource' do
        expect(Eucalyptus::CustomAudience.find(123, graph: graph) ).to be_a Eucalyptus::CustomAudience
      end

      it 'takes an id and returns an object which returns that id' do
        audience = Eucalyptus::CustomAudience.find(123, graph: graph) 
        expect(audience.id).to eql "123"
      end
    end

    describe '.all' do
      let(:response) { [{ "id" => "123"}, {"id" => "321"}] }
      let(:graph) { double(:graph, get_connection: response) }
      let(:parent) { double(:parent, id: 123) }

      it 'returns a collection of resources' do
        expect(Eucalyptus::CustomAudience.all(graph: graph, parent: parent)).to be_a Array
      end
    end

    describe '#method_missing' do
      let(:response) { { "id" => "123", "name" => "Audience", "stats" => {"cpa" => "12"} }}
      let(:resource) { Eucalyptus::CustomAudience.new(response) }
      it 'responds to a message which corresponds with a key in the response hash' do
        expect( resource.name ).to eql "Audience"
      end

      it 'works with nested hashes too' do
        expect( resource.stats.cpa ).to eql "12"
      end

      it 'returns nil when tryng to access a key which doesnt exist in the response' do
        expect( resource.fake_key ).to eql nil
      end
    end
  end
end
