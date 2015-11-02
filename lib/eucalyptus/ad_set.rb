require_relative 'resource'

module Eucalyptus
  class AdSet < Resource
    def self.known_fields
      [
        :id,
        :account_id,
        :campaign_group_id,
        :campaign_status,
        :created_time,
        :name,
        :targeting
      ]
    end

    def campaign; Campaign.find(self.campaign_group_id); end

    def self.api_path
      "adcampaigns"
    end
  end
end
