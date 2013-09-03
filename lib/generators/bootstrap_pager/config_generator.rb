module BootstrapPager
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies BootstrapPager configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'bootstrap_pager_config.rb', 'config/initializers/bootstrap_pager_config.rb'
      end
    end
  end
end
