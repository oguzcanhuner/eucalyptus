require_relative 'resource'

module Eucalyptus
  class Account < Resource
    def self.known_fields
      [
        :account_status,
        :age,
        :agency_client_declaration,
        :amount_spent,
        :balance,
        :business,
        :business_city,
        :business_country_code,
        :business_name,
        :business_street,
        :business_street2,
        :business_zip,
        :capabilities,
        :created_time,
        :currency,
        :daily_spend_limit,
        :end_advertiser,
        :funding_source,
        :funding_source_details,
        :is_personal,
        :media_agency,
        :name,
        :offsite_pixels_tos_accepted,
        :partner,
        :rf_spec,
        :spend_cap,
        :tax_id_status,
        :timezone_id,
        :timezone_name,
        :timezone_offset_hours_utc,
        :tos_accepted,
        :users
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

    # ASSOCIATOINS
    def ads; Ad.all(parent: self); end
    def ad_sets; AdSet.all(parent: self); end
    def campaigns; Campaign.all(parent: self); end
    def insights; Insight.all(parent: self); end
  end
end
