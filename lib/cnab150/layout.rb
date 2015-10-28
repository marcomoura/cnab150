Dir[File.dirname(__FILE__) + '/layout/*.rb'].each {|file| require file }
require 'cnab150/errors/layout_not_implemented_error'

module Cnab150
  module Layout
    def self.build(type)
      eval("Cnab150::Layout::#{type.upcase}").new
    rescue NameError
      fail Cnab150::Errors::LayoutNotImplementedError
    end
  end
end
