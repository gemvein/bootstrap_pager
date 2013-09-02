require 'bootstrap_pager/sinatra'
require 'bootstrap_pager/helpers/action_view_extension'
require 'rack/test'
require 'sinatra/test_helpers'
require 'capybara/rspec'

require 'fake_app/sinatra_app'

Capybara.app = SinatraApp

module HelperMethodForHelperSpec
  module FakeEnv
    def env
      {'PATH_INFO' => '/'}
    end
  end

  def helper
    # OMG terrible object...
    ::BootstrapPager::Helpers::SinatraHelpers::ActionViewTemplateProxy.new(:current_params => {}, :current_path => '/', :param_name => BootstrapPager.config.param_name).extend(Padrino::Helpers, BootstrapPager::ActionViewExtension, BootstrapPager::Helpers::SinatraHelpers::HelperMethods, FakeEnv)
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Sinatra::TestHelpers
  config.include HelperMethodForHelperSpec
#   config.include HelperMethodForHelperSpec, :type => :helper
end

require 'nokogiri'
def last_document
  Nokogiri::HTML(last_response.body)
end
