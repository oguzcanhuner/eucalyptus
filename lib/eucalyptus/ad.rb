require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.known_fields
      [
        :name,
        :adgroup_status,
        :bid_info,
        :conversion_specs,
        :campaign_id,
        :creative,
        :engagement_audiences,
        :execution_options,
        :redownload,
        :tracking_specs,
        :social_prefs
      ]
    end

    def ad_set
      AdSet.find(self.campaign_id)
    end

    def self.api_path
      "adgroups"
    end
  end
end
