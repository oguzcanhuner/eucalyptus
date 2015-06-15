require_relative 'resource'

module Eucalyptus
  class CustomAudience < Resource
    def self.api_path
      "customaudiences"
    end

    def self.parent
      Account.all.last
    end
  end
end
