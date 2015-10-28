require 'cnab150/version'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'

module Cnab150
  def self.parse_registries(registries)
    registries.each_with_object([]) do |r, a|
      a << parse_registry(r).to_hash
    end
  end

  def self.parse_registry(registry)
    type = Cnab150::Layout.build(registry.chars.first)
    Cnab150::Registry.new(registry, type)
  end

  def self.header(registries)
    registries.find { |r| r[:registry_code].eql?('A') }
  end
end
