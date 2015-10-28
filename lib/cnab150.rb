require 'cnab150/version'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'
require 'cnab150/errors'

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
    self.find(registries, 'A')
  end

  def self.trailer(registries)
    self.find(registries, 'Z')
  end

  def self.details(registries)
    registries.select { |r| !(r[:registry_code].eql?('A') || r[:registry_code].eql?('Z')) }
  end

  def self.find(registries, type)
    registries.find { |r| r[:registry_code].eql?(type) }
  end
end
