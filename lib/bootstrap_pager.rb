module BootstrapPager
end

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

$stderr.puts <<-EOC if !defined?(Rails) && !defined?(Sinatra) && !defined?(Grape)
warning: no framework detected.

Your Gemfile might not be configured properly.
---- e.g. ----
Rails:
    gem 'bootstrap_pager'

Sinatra/Padrino:
    gem 'bootstrap_pager', :require => 'bootstrap_pager/sinatra'

Grape:
    gem 'bootstrap_pager', :require => 'bootstrap_pager/grape'

EOC

# load BootstrapPager components
require 'bootstrap_pager/config'
require 'bootstrap_pager/helpers/paginator'
require 'bootstrap_pager/models/page_scope_methods'
require 'bootstrap_pager/models/configuration_methods'
require 'bootstrap_pager/hooks'

# if not using Railtie, call `BootstrapPager::Hooks.init` directly
if defined? Rails
  require 'bootstrap_pager/railtie'
  require 'bootstrap_pager/engine'
end
