require_relative 'resource'

module Eucalyptus
  class Insight < Resource
    def self.known_fields
      nil
    end

    def self.find
      raise "An insight can only be used as part of a combined call. Try Insight.all"
    end

    def self.api_path
      'insights'
    end
  end
end
