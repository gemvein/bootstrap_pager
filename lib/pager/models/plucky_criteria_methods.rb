module Pager
  module PluckyCriteriaMethods
    include Pager::PageScopeMethods
    include Pager::ConfigurationMethods::ClassMethods

    def limit_value #:nodoc:
      options[:limit]
    end

    def offset_value #:nodoc:
      options[:skip]
    end

    def total_count #:nodoc:
      count
    end
  end
end
