require_relative 'resource'

module Eucalyptus
  class Account < Resource
    def self.known_fields
      [
        :account_id,
        :account_status,
        :created_time,
        :name
      ]
    end

    def self.api_path
      "adaccounts"
    end


    # 'me' is a facebook helper which refers to the user who created the access token
    #
    # there is no object which abstracts this, which is why we're using a generic 
    # open struct that can response to id
    def self.parent
      OpenStruct.new(id: "me")
    end
  end
end
