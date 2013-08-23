module Pager
  class Hooks
    def self.init
      ActiveSupport.on_load(:active_record) do
        require 'pager/models/active_record_extension'
        ::ActiveRecord::Base.send :include, Pager::ActiveRecordExtension
      end

      begin; require 'data_mapper'; rescue LoadError; end
      if defined? ::DataMapper
        require 'dm-aggregates'
        require 'pager/models/data_mapper_extension'
        ::DataMapper::Collection.send :include, Pager::DataMapperExtension::Collection
        ::DataMapper::Model.append_extensions Pager::DataMapperExtension::Model
        # ::DataMapper::Model.send :extend, Pager::DataMapperExtension::Model
      end

      begin; require 'mongoid'; rescue LoadError; end
      if defined? ::Mongoid
        require 'pager/models/mongoid_extension'
        ::Mongoid::Criteria.send :include, Pager::MongoidExtension::Criteria
        ::Mongoid::Document.send :include, Pager::MongoidExtension::Document
      end

      ActiveSupport.on_load(:mongo_mapper) do
        require 'pager/models/mongo_mapper_extension'
        ::MongoMapper::Document.send :include, Pager::MongoMapperExtension::Document
        ::Plucky::Query.send :include, Pager::PluckyCriteriaMethods
      end

      # Rails 3.0.x fails to load helpers in Engines (?)
      if defined?(::ActionView) && ::ActionPack::VERSION::STRING < '3.1'
        ActiveSupport.on_load(:action_view) do
          require 'pager/helpers/action_view_extension'
          ::ActionView::Base.send :include, Pager::ActionViewExtension
        end
      end
      require 'pager/models/array_extension'
    end
  end
end
