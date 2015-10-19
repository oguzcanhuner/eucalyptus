require 'koala'
Dir[File.dirname(__FILE__) + '/eucalyptus/**/*.rb'].each do |file|
  require file
end

Koala.config.api_version = 'v2.3'

module Eucalyptus
  class << self
    attr_accessor :access_token, :default_account_id, :graph

    def configure
      yield(self)
      self.graph = Koala::Facebook::API.new(access_token)
      self.default_account_id = default_account_id
    end

    def default_account
      raise "Please provide a default account id" if self.default_account_id.nil?
      @default_account ||= Eucalyptus::Account.find("act_#{self.default_account_id}") 
    end
  end
end
