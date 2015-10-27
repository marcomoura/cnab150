module Cnab150
  class Parser
    def self.build(line, layout)
      h = new(line, layout)
      fail ArgumentError, 'Line size is lesser than 150 chars' unless h.valid?
      h
    end

    def initialize(line, layout)
      @line = line
      @layout = layout
    end

    def valid?
      @line.size.eql?(150)
    end

    def to_hash(keys)
      Hash[keys.zip(to_a)]
    end

    def to_a
      @_process ||= @line.unpack(@layout)
    end
  end
end
