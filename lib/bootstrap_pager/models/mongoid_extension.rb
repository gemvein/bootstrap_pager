require 'bootstrap_pager/models/mongoid_criteria_methods'

module BootstrapPager
  module MongoidExtension
    module Criteria
      extend ActiveSupport::Concern

      included do
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{BootstrapPager.config.page_method_name}(*args)
            super(*args).criteria.merge(self)
          end
        RUBY
      end
    end

    module Document
      extend ActiveSupport::Concern
      include BootstrapPager::ConfigurationMethods

      included do
        # Fetch the values at the specified page number
        #   Model.page(5)
        scope BootstrapPager.config.page_method_name, Proc.new {|num|
          limit(default_per_page).offset(default_per_page * ([num.to_i, 1].max - 1))
        } do
          include BootstrapPager::MongoidCriteriaMethods
          include BootstrapPager::PageScopeMethods
        end
      end
    end
  end
end
