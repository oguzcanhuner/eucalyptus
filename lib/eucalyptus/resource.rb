module Eucalyptus
  class Resource
    def self.api_path
      raise "You must implement this method"
    end

    def self.parent
      raise "You must implement this method"
    end

    def self.find(id, graph: Eucalyptus.graph)
      response = graph.get_object(id)
      self.new(response)
    end

    def self.all(graph: Eucalyptus.graph, parent: parent)
      response = graph.get_connection(parent, api_path)
      response.collect{ |res| self.new(res) }
    end

    def initialize(response)
      @response = Response.new(response)
    end

    def method_missing(method_sym, *args, &block)
      @response.send(method_sym)
    end
  end
end
