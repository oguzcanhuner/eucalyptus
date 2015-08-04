module Eucalyptus
  class Response < OpenStruct
    # extend OpenStruct to work with nested hashes
    def initialize(hash)
      @table = {}
      @hash_table = {}

      hash.each do |k, v|
        @table[k.to_sym] = (v.is_a?(Hash) ? self.class.new(v) : v)
        @hash_table[k.to_sym] = v

        new_ostruct_member(k)
      end
    end
  end

  class ResponseCollection
    def initialize(klass, koala_response)
      @koala_response = koala_response
      @klass = klass
      @array = elements(@koala_response)
    end


    def next_page
      next_page = @koala_response.next_page
      self.class.new(@klass, next_page)
    end

    # for array methods
    def method_missing(method_sym, *args, &block)
      @array.send(method_sym)
    end

    private
    def elements(response)
      response.collect{ |res| @klass.new(res) }
    end
  end
end
