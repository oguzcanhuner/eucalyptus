require_relative 'resource'

module Eucalyptus
  class Account < Resource
    def self.api_path
      "adaccounts"
    end

    # 'me' is a facebook helper which refers to the user who created the access token
    def self.parent
      OpenStruct.new(id: "me")
    end
  end
end
