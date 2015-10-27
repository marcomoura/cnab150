require 'cnab150/layout/header'
require 'cnab150/layout/trailer'
require 'cnab150/layout/detail'

module Cnab150
  module Layout
    def self.build(type)
      case
      when type.eql?('A')
        Cnab150::Layout::Header
      when type.eql?('Z')
        Cnab150::Layout::Trailer
      else
        Cnab150::Layout::Detail
      end.new
    end
  end
end
