module Eucalyptus
  class Resource
    def self.api_path
      raise "You must implement #{__method__.to_s}"
    end

    def self.known_fields
      raise "You must implement #{__method__.to_s}"
    end

    def self.parent
      Account.all.last
    end

    def self.find(id, fields: [], graph: Eucalyptus.graph)
      fields.concat(self.known_fields).uniq

      response = graph.get_object(id, fields: fields)
      self.new(response)
    end

    def self.all(graph: Eucalyptus.graph, parent: self.parent, options: {})
      if options[:fields]
        options[:fields].concat(self.known_fields).uniq
      else
        options[:fields] = self.known_fields
      end

      options[:limit] = 5000

      response = graph.get_connection(parent.id, api_path, options)
      response.collect{ |res| self.new(res) }
    end


    def initialize(response)
      @response = Response.new(response)
    end

    def method_missing(method_sym, *args, &block)
      @response.send(method_sym)
    end

    def respond_to?(method_sym, include_private = false)
      @response.respond_to?(method_sym)
    end

    def update(graph: Eucalyptus.graph, fields:)
      graph.put_connections(self.id, "", fields)
    end

    def ads(options={}) 
      Ad.all(parent: self, options: options)
    end

    def campaigns(options={}) 
      Campaign.all(parent: self, options: options)
    end

    def ad_sets(options={}) 
      AdSet.all(parent: self, options: options)
    end

    def insights(options={})
      Insight.all(parent: self, options: options)
    end
  end
end
