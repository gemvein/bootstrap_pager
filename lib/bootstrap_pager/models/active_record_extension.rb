require 'bootstrap_pager/models/active_record_model_extension'

module BootstrapPager
  module ActiveRecordExtension
    extend ActiveSupport::Concern
    included do
      # Future subclasses will pick up the model extension
      class << self
        def inherited_with_bootstrap_pager(kls) #:nodoc:
          inherited_without_bootstrap_pager kls
          kls.send(:include, BootstrapPager::ActiveRecordModelExtension) if kls.superclass == ActiveRecord::Base
        end
        alias_method_chain :inherited, :bootstrap_pager
      end

      # Existing subclasses pick up the model extension as well
      self.descendants.each do |kls|
        kls.send(:include, BootstrapPager::ActiveRecordModelExtension) if kls.superclass == ActiveRecord::Base
      end
    end
  end
end
