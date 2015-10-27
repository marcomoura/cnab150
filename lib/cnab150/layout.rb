Dir[File.dirname(__FILE__) + '/layout/*.rb'].each {|file| require file }

module Cnab150
  module Layout
    def self.build(type)
      case
      when type.eql?('A')
        Cnab150::Layout::A
      when type.eql?('Z')
        Cnab150::Layout::Z
      when type.eql?('G')
        Cnab150::Layout::G
      else
        fail NotImplementedError
      end.new
    end
  end
end
