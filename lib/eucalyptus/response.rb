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
end
