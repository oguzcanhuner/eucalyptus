require_relative 'resource'

module Eucalyptus
  class CustomAudience < Resource
    def self.api_path
      "customaudiences"
    end

    def self.known_fields
      [:name, :description]
    end
  end
end
