require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Eucalyptus" do
  describe ".configure" do
    let(:access_token) { "123abc" }
    let(:default_account_id) { "456ghb" }

    before do
      Eucalyptus.configure do |config|
        config.access_token = access_token
        config.default_account_id = default_account_id
      end
    end

    it "returns a graph object which has the configured access_token" do
      graph = Eucalyptus.graph
      expect(graph.access_token).to eql access_token
    end

    it 'returns a default account object' do
      #Eucalyptus.default_account
    end
  end

end
