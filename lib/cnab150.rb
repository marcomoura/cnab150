require 'cnab150/configuration'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'
require 'cnab150/errors'
require 'cnab150/version'

# The public interface of gem
module Cnab150
  class << self
    def parse_registries(registries)
      registries.each_with_object([]) do |r, a|
        a << parse_registry(r)
      end
    end

    def parse_registry(registry)
      type = Cnab150::Layout.build(registry.chars.first)
      Cnab150::Registry.new(registry, type)
    end

    def header(registries)
      find(registries, 'A')
    end

    def trailer(registries)
      find(registries, 'Z')
    end

    def details(registries)
      registries.select do |r|
        !(r.registry_code.eql?('A') || r.registry_code.eql?('Z'))
      end
    end

    def select(type, raw)
      registries = parse_registries(raw)
      registries.select do |r|
        r.registry_code.eql?(type.to_s.upcase)
      end
    end

    def find(registries, type)
      registries.find { |r| r.registry_code.eql?(type) }
    end
  end
end
