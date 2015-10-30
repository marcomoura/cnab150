require 'cnab150/version'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'
require 'cnab150/errors'

# The public interface of gem
module Cnab150
  def self.parse_registries(registries)
    registries.each_with_object([]) do |r, a|
      a << parse_registry(r)
    end
  end

  def self.parse_registry(registry)
    type = Cnab150::Layout.build(registry.chars.first)
    Cnab150::Registry.new(registry, type)
  end

  def self.header(registries)
    find(registries, 'A')
  end

  def self.trailer(registries)
    find(registries, 'Z')
  end

  def self.details(registries)
    registries.select do |r|
      !(r.registry_code.eql?('A') || r.registry_code.eql?('Z'))
    end
  end

  def self.find(registries, type)
    registries.find { |r| r.registry_code.eql?(type) }
  end
end
