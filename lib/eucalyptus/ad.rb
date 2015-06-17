require_relative 'resource'

module Eucalyptus
  class Ad < Resource
    def self.known_fields
      [
        :account_id,
        :bid_info,
        :bid_type,
        :budget_remaining,
        :campaign_group_id,
        :campaign_status,
        :created_time,
        :creative_sequence,
        :daily_budget,
        :end_time,
        :is_autobid,
        :lifetime_budget,
        :name,
        :promoted_object,
        :rf_prediction_id,
        :start_time,
        :targeting,
        :updated_time
      ]
    end

    def self.api_path
      "adgroups"
    end
  end
end
