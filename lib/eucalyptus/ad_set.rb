require_relative 'resource'

module Eucalyptus
  class AdSet < Resource
    def self.known_fields
    end

    def self.api_path
      "adcampaigns"
    end
  end
end
