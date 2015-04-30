module Synchro
  class ServiceRunner
    def initialize(object)
      @service_class = "Synchro::#{object.class.name}Sync"
      @object = object
    end

    def prepare_data
      @service_class.constantize.new(@object).prepare_data
    end
  end
end
