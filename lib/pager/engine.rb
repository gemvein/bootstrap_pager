module Pager
  class Engine < ::Rails::Engine
    initializer 'cooperative.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/vendor"
    end
  end
end
