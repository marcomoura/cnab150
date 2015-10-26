module Cnab150
  class Parser
    def self.to_a(line, layout)
      h = new(line, layout)
      fail ArgumentError, 'Line size is lesser than 150 chars' unless h.valid?
      h.to_a
    end

    def initialize(line, layout)
      @line, @layout = line, layout
    end

    def to_a
      @_process ||= @line.unpack(@layout)
    end

    def valid?
      @line.size.eql?(150)
    end
  end
end

