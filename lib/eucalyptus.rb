require 'koala'
Dir[File.dirname(__FILE__) + '/eucalyptus/**/*.rb'].each do |file|
  require file
end


module Eucalyptus
  class << self
    attr_accessor :api_version, :access_token, :default_account_id, :graph

    def configure
      yield(self)
      Koala.config.api_version = api_version
      self.graph = Koala::Facebook::API.new(access_token)
    end

    def default_account
      raise "Please provide a default account id" if self.default_account_id.nil?
      @default_account ||= Eucalyptus::Account.find("act_#{self.default_account_id}") 
    end
  end
end
