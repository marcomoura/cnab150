module Cnab150
  class Registry
    def initialize(line, registry, parse=Cnab150::Parser)
      @line, @registry, @parse = line, registry, parse
    end

    def to_hash
      values.to_hash(@registry.keys)
    end

    private

    def values
      @_ ||= @parse.build(@line, @registry.layout)
    end
  end
end
