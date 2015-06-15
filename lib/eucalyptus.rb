require 'koala'
Dir[File.dirname(__FILE__) + '/eucalyptus/**/*.rb'].each do |file|
  require file
end

module Eucalyptus
  class << self
    attr_accessor :access_token, :graph

    def configure
      yield(self)
      self.graph = Koala::Facebook::API.new(access_token)
    end
  end
end
