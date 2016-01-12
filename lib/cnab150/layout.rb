require 'yaml'

module Cnab150
  # The Layout module is responsible of build the appropriate layout.
  class Layout
    def self.build(type)
      fail Cnab150::Errors::LayoutNotImplementedError unless
      Cnab150.config.layouts.include?(type.downcase)

      new Cnab150.config.layouts[type.downcase]
    end

    def initialize(layout)
      @layout = layout
    end

    def keys
      @layout.keys.map(&:to_sym)
    end

    def layout
      'A' + @layout.values.join('A')
    end
  end
end
