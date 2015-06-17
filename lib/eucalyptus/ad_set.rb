require_relative 'resource'

module Eucalyptus
  class AdSet < Resource
    def self.known_fields
      [
        :buying_type,
        :campaign_group_status,
        :name,
        :objective,
        :spend_cap
      ]
    end

    def self.api_path
      "adcampaigns"
    end
  end
end
