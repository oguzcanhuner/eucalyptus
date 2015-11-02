require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.known_fields
      [
        :id,
        :account_id,
        :adgroup_status,
        :campaign_id,
        :campaign_group_id,
        :conversion_specs,
        :created_time,
        :targeting,
        :tracking_specs,
        :name
      ]
    end

    def ad_set; AdSet.find(self.campaign_id); end

    def self.api_path
      "adgroups"
    end
  end
end
