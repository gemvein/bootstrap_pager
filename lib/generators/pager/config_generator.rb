module Pager
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies Pager configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'pager_config.rb', 'config/initializers/pager_config.rb'
      end
    end
  end
end
