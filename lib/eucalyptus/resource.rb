module Eucalyptus
  class Resource
    def self.find(id, graph: Eucalyptus.graph)
      response = graph.get_object(id)
      self.new(response)
    end

    def initialize(response)
      @id = response["id"]
    end
    attr_reader :id
  end
end
