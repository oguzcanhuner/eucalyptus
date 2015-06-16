require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Eucalyptus::Resource do
  before do
    Eucalyptus.configure do |config|
      config.access_token = ENV["ACCESS_TOKEN"]
    end
  end

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

      context 'when the target class has defined valid known fields' do
        before do
          expect(Eucalyptus::CustomAudience.known_fields).to include :name
        end

        it 'returns an object which responds to those fields' do
          VCR.use_cassette("custom_audience") do
            audience = Eucalyptus::CustomAudience.find(6025480500671) 
            expect(audience).to respond_to :name
          end
        end

        it 'returns an object which doesnt respond to unkown fields' do
          VCR.use_cassette("custom_audience") do
            audience = Eucalyptus::CustomAudience.find(6025480500671) 
            expect(audience).to_not respond_to :random_method
          end
        end
      end
    end

    describe '.all' do
      let(:response) { [{ "id" => "123"}, {"id" => "321"}] }
      let(:graph) { double(:graph, get_connection: response) }
      let(:parent) { double(:parent, id: 123) }

      it 'returns a collection of resources' do
        expect(Eucalyptus::CustomAudience.all(graph: graph, parent: parent)).to be_a Array
      end

      context 'when the target class has defined valid known fields' do
        let(:graph) { double(:graph, get_connection: [{ "id" => "123", "name" => "test-audience" }]) }

        before do
          expect(Eucalyptus::CustomAudience.known_fields).to include :name
        end

        it 'returns an object which responds to those fields' do
          VCR.use_cassette("custom_audiences") do
            audiences = Eucalyptus::CustomAudience.all
            expect(audiences.first).to respond_to :name
          end
        end

        it 'returns an object which doesnt respond to unkown fields' do
          audiences = Eucalyptus::CustomAudience.all(graph: graph, parent: parent) 
          expect(audiences.first).to_not respond_to :random_method
        end
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
