require_relative 'resource'

module Eucalyptus
  class Account < Resource
    def self.known_fields
    end

    def self.api_path
      "adaccounts"
    end

    # 'me' is a facebook helper which refers to the user who created the access token
    def self.parent
      OpenStruct.new(id: "me")
    end

    # associations
    def ads; Ad.all(parent: self); end
    def ad_sets; AdSet.all(parent: self); end
    def campaigns; Campaign.all(parent: self); end
  end
end
