require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.known_fields
      [
        :id,
        :account_id,
        :adgroup_review_feedback,
        :adgroup_status,
        :bid_type,
        :bid_info,
        :campaign_id,
        :campaign_group_id,
        :conversion_specs,
        :created_time,
        :creative,
        :failed_delivery_checks,
        :targeting,
        :tracking_specs,
        :updated_time,
        :name
      ]
    end

    def ad_set; AdSet.find(self.campaign_id); end

    def self.api_path
      "adgroups"
    end
  end
end
