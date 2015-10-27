require 'cnab150/version'
require 'cnab150/registry'
require 'cnab150/parser'
require 'cnab150/layout/header'
require 'cnab150/layout/trailer'
require 'cnab150/layout/detail'
require 'cnab150/file'

module Cnab150
  def self.parse_registry(registry)
    type = case
           when registry.upcase.start_with?('A')
             Cnab150::Layout::Header
           when registry.upcase.start_with?('Z')
             Cnab150::Layout::Trailer
           else
             Cnab150::Layout::Detail
           end.new
    Cnab150::Registry.new(registry, type)
  end
end
