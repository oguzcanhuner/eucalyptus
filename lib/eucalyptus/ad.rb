require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.known_fields
    end

    def self.api_path
      "adgroups"
    end
  end
end
