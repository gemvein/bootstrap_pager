require 'pager/models/active_record_relation_methods'

module Pager
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do
      self.send(:include, Pager::ConfigurationMethods)

      # Fetch the values at the specified page number
      #   Model.page(5)
      self.scope Pager.config.page_method_name, Proc.new {|num|
        limit(default_per_page).offset(default_per_page * ([num.to_i, 1].max - 1))
      } do
        include Pager::ActiveRecordRelationMethods
        include Pager::PageScopeMethods
      end
    end
  end
end
