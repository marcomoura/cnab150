require 'cnab150/configuration'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout'
require 'cnab150/errors'
require 'cnab150/version'

module Cnab150 #:nodoc:
  class << self
    # Parser the array of string to Cnab150 registries.
    # The result is an array of Cnab150::Registry instance
    #
    # Parameters:
    # * <tt>registries</tt> - an array of string
    #
    # Example:
    #   array_of_string = ['A20000111111111 XXXX XXXXXX-XYZ 341BANK',
    #                      '2015101600131203                      F']
    #   Cnab150.parse_registry(array_of_string)
    #     #-> [ Cnab150::Registry, Cnab150::Registry]
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
