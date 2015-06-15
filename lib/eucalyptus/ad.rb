require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.api_path
      "adgroups"
    end
  end
end
