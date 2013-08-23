require 'pager/models/active_record_model_extension'

module Pager
  module ActiveRecordExtension
    extend ActiveSupport::Concern
    included do
      # Future subclasses will pick up the model extension
      class << self
        def inherited_with_pager(kls) #:nodoc:
          inherited_without_pager kls
          kls.send(:include, Pager::ActiveRecordModelExtension) if kls.superclass == ActiveRecord::Base
        end
        alias_method_chain :inherited, :pager
      end

      # Existing subclasses pick up the model extension as well
      self.descendants.each do |kls|
        kls.send(:include, Pager::ActiveRecordModelExtension) if kls.superclass == ActiveRecord::Base
      end
    end
  end
end
