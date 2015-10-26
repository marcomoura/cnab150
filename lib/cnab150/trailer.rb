module Cnab150
  class Trailer
    def initialize(line, parse=Parser)
      @line, @parse = line, parse
    end

    def to_hash
      values.to_hash(keys)
    end

    private

    def keys
      [:registry_code, :rows, :total, :filler]
    end

    def values
      @_ ||= @parse.build(@line, layout)
    end

    def layout
      "Z" + [1, 6, 17, 126].join("Z")
    end
  end
end