module Cnab150
  class Parser
    def self.build(line, layout)
      new(line, layout)
    end

    def initialize(line, layout)
      @line = line
      @layout = layout
    end

    def to_hash(keys)
      Hash[keys.zip(to_a)]
    end

    def to_a
      @_process ||= @line.unpack(@layout)
    end
  end
end
