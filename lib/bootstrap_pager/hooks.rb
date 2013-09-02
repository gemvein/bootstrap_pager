module BootstrapPager
  class Hooks
    def self.init
      ActiveSupport.on_load(:active_record) do
        require 'bootstrap_pager/models/active_record_extension'
        ::ActiveRecord::Base.send :include, BootstrapPager::ActiveRecordExtension
      end

      begin; require 'data_mapper'; rescue LoadError; end
      if defined? ::DataMapper
        require 'dm-aggregates'
        require 'bootstrap_pager/models/data_mapper_extension'
        ::DataMapper::Collection.send :include, BootstrapPager::DataMapperExtension::Collection
        ::DataMapper::Model.append_extensions BootstrapPager::DataMapperExtension::Model
        # ::DataMapper::Model.send :extend, BootstrapPager::DataMapperExtension::Model
      end

      begin; require 'mongoid'; rescue LoadError; end
      if defined? ::Mongoid
        require 'bootstrap_pager/models/mongoid_extension'
        ::Mongoid::Criteria.send :include, BootstrapPager::MongoidExtension::Criteria
        ::Mongoid::Document.send :include, BootstrapPager::MongoidExtension::Document
      end

      ActiveSupport.on_load(:mongo_mapper) do
        require 'bootstrap_pager/models/mongo_mapper_extension'
        ::MongoMapper::Document.send :include, BootstrapPager::MongoMapperExtension::Document
        ::Plucky::Query.send :include, BootstrapPager::PluckyCriteriaMethods
      end

      # Rails 3.0.x fails to load helpers in Engines (?)
      if defined?(::ActionView) && ::ActionPack::VERSION::STRING < '3.1'
        ActiveSupport.on_load(:action_view) do
          require 'bootstrap_pager/helpers/action_view_extension'
          ::ActionView::Base.send :include, BootstrapPager::ActionViewExtension
        end
      end
      require 'bootstrap_pager/models/array_extension'
    end
  end
end
