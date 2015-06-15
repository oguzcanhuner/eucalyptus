require_relative 'resource'

module Eucalyptus
  class AdSet < Resource
    def self.api_path
      "adcampaigns"
    end
  end
end
