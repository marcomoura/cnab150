module Cnab150 #:nodoc:
  class << self
    # Configures global settings
    #   Cnab150.configure do |config|
    #     config.default_per_page = 10
    #   end
    def configure
      yield(@config)
    end

    # Global settings
    #
    # @return a instance of Cnab150::Configuration
    def config
      @config ||= Cnab150::Configuration.new
    end
  end

  class Configuration #:nodoc:
    attr_accessor :layout_file_path

    def initialize
      @layout_file_path = "#{File.dirname(__dir__)}/../config/layout.yml"
    end

    # The layouts method load the layouts from the yml file.
    def layouts
      @_ ||= YAML.load_file(@layout_file_path)['cnab150']
    end
  end
end
