require 'bootstrap_pager/models/active_record_relation_methods'

module BootstrapPager
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do
      self.send(:include, BootstrapPager::ConfigurationMethods)

      # Fetch the values at the specified page number
      #   Model.page(5)
      self.scope BootstrapPager.config.page_method_name, Proc.new {|num|
        limit(default_per_page).offset(default_per_page * ([num.to_i, 1].max - 1))
      } do
        include BootstrapPager::ActiveRecordRelationMethods
        include BootstrapPager::PageScopeMethods
      end
    end
  end
end
