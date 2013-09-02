module BootstrapPager
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'bootstrap_pager' do |_app|
      BootstrapPager::Hooks.init
    end
  end
end
