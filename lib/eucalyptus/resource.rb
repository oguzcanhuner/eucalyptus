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

    def self.find(id, graph: Eucalyptus.graph, fields: self.known_fields)
      response = graph.get_object(id, fields: fields)
      self.new(response)
    end

    def self.all(graph: Eucalyptus.graph, parent: self.parent, fields: self.known_fields)
      response = graph.get_connection(parent.id, api_path, fields: fields)
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
  end
end
