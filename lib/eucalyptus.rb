require 'koala'

module Eucalyptus
  class << self
    attr_accessor :access_token, :graph

    def configure
      yield(self)
      self.graph = Koala::Facebook::API.new(access_token)
    end
  end
end
