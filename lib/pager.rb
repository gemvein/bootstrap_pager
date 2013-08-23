module Pager
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
    gem 'pager'

Sinatra/Padrino:
    gem 'pager', :require => 'pager/sinatra'

Grape:
    gem 'pager', :require => 'pager/grape'

EOC

# load Pager components
require 'pager/config'
require 'pager/helpers/paginator'
require 'pager/models/page_scope_methods'
require 'pager/models/configuration_methods'
require 'pager/hooks'

# if not using Railtie, call `Pager::Hooks.init` directly
if defined? Rails
  require 'pager/railtie'
  require 'pager/engine'
end
