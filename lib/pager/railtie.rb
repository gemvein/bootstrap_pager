module Pager
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'pager' do |_app|
      Pager::Hooks.init
    end
  end
end
