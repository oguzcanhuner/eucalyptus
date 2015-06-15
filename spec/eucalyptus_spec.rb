require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Eucalyptus" do
  describe ".configure" do
    let(:access_token) { "123abc" }

    before do
      Eucalyptus.configure do |config|
        config.access_token = access_token
      end
    end

    it "returns a graph object which has the configured access_token" do
      graph = Eucalyptus.graph
      expect(graph.access_token).to eql access_token
    end
  end

end
