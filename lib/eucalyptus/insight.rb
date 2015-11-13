require_relative 'resource'

module Eucalyptus
  class Insight < Resource
    def self.known_fields
     [
        :clicks,
        :cpc,
        :ctr,
        :reach,
        :relevance_score,
        :spend,
        :cost_per_action_type,
        :action_values,
        :actions
      ]
    end

    def self.find
      raise "An insight can only be used as part of a combined call. Try Insight.all"
    end

    def self.api_path
      'insights'
    end
  end
end
