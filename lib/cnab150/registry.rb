module Cnab150
  # The Regisry class is responsible to transform the string into a object
  # and is the public interface.
  class Registry
    # Returns a new instance of Registry
    #
    # @param line [String]
    # @param registry [Cnab150::Regisry]
    # @param parse [Cnab150::Parser]
    #
    def initialize(line, registry, parse = Cnab150::Parser)
      @line = line
      @registry = registry
      @parse = parse
    end

    # Return a hash of registry
    #
    # @return [Hash]
    #
    def to_hash
      @_r ||= values.to_hash(@registry.keys)
    end

    # Return the string raw registry
    #
    # @return [String]
    #
    def raw
      @line
    end

    private

    def values
      @_v ||= @parse.build(@line, @registry.layout)
    end

    def method_missing(method)
      return to_hash[method] if to_hash.key?(method.to_sym)
      super
    end
  end
end
