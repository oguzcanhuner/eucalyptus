require_relative 'resource'

module Eucalyptus
  class Campaign < Resource
    def self.api_path
      "adcampaign_groups"
    end
  end
end
