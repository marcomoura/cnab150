require 'yaml'

module Cnab150
  # The Layout module is responsible of build the appropriate layout.
  class Layout
    # Layout builder
    #
    # @param type [String] The type of registry
    #
    # Returns a new instance of Layout
    #
    # @example Cnab150.build('A')
    #
    def self.build(type)
      fail Cnab150::Errors::LayoutNotImplementedError unless
      Cnab150.config.layouts.include?(type.downcase)

      new Cnab150.config.layouts[type.downcase]
    end

    # Returns a new instance of Layout
    #
    # @param layout [Hash]
    #
    # @example Cnab150.new(a: 1, b: 2)
    #
    def initialize(layout)
      @layout = layout
    end

    # Return an array of layout keys
    #
    # @return [Array<Symbol>]
    #
    def keys
      @layout.keys.map(&:to_sym)
    end

    # Returns a string, this is the format string of registry
    #
    # @return The format string of registry
    #
    # @return [String]
    #
    def layout
      'A' + @layout.values.join('A')
    end
  end
end
