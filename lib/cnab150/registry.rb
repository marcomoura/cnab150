module Cnab150
  class Registry
    def self.build(registry, parse=Cnab150::Parser)
      type = if registry.upcase.start_with?('A')
               Cnab150::Layout::Header
             elsif registry.upcase.start_with?('Z')
               Cnab150::Layout::Trailer
             else
               Cnab150::Layout::Row
             end.new
      new(registry, type, parse)
    end

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
