require 'cnab150/version'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'

module Cnab150
  def self.parse_registry(registry)
    type = Cnab150::Layout.build(registry.chars.first)
    Cnab150::Registry.new(registry, type)
  end
end
