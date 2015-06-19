require_relative 'resource'

module Eucalyptus
  class Insight < Resource
    def self.known_fields
      [
        :actions_per_impression,
        :call_to_action_clicks,
        :clicks,
        :unique_clicks,
        :cost_per_total_action,
        :cpc,
        :cost_per_unique_click,
        :cpm,
        :cpp,
        :ctr,
        :website_ctr,
        :unique_ctr,
        :frequency,
        :impressions,
        :reach,
        :relevance_score,
        :roas,
        :social_clicks,
        :unique_social_clicks,
        :social_impressions,
        :social_reach,
        :spend,
        :total_action_value,
        :total_actions,
        :total_unique_actions
      ]
    end

    def self.api_path
      'insights'
    end
  end
end
