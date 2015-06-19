require_relative 'resource'

module Eucalyptus
  class Campaign < Resource
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
      "adcampaign_groups"
    end

    def ads; Ad.all(parent: self); end
    def ad_sets; AdSet.all(parent: self); end
    def insights; Insight.all(parent: self); end
  end
end
