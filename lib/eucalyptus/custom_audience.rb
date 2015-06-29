require_relative 'resource'

module Eucalyptus
  class CustomAudience < Resource
    def self.api_path
      "customaudiences"
    end

    def ad_sets(from_collection: AdSet.all)
      from_collection.collect do |ad_set|
        if ad_set.targeting.custom_audiences
          ad_set if ad_set.targeting.custom_audiences.any?{|a| a["id"] == self.id }
        end
      end.compact
    end

    def self.known_fields
      [:name, :description]
    end
  end
end
