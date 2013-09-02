require 'bootstrap_pager/models/plucky_criteria_methods'

module BootstrapPager
  module MongoMapperExtension
    module Document
      extend ActiveSupport::Concern
      include BootstrapPager::ConfigurationMethods

      included do
        # Fetch the values at the specified page number
        #   Model.page(5)
        scope BootstrapPager.config.page_method_name, Proc.new {|num|
          limit(default_per_page).offset(default_per_page * ([num.to_i, 1].max - 1))
        }
      end
    end
  end
end
