require_relative 'resource'

module Eucalyptus
  class Campaign < Resource
    def self.known_fields
      [
        :name,
        :status,
        :users,
        :accounts
      ]
    end

    def self.api_path
      "adcampaign_groups"
    end
  end
end
