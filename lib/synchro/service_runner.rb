module Synchro
  class ServiceRunner
    def initialize(klass)
      @service_class = "Synchro::#{klass.name}Sync"
    end

    def prepare_data
      @service_class.constantize.new.prepare_data
    end
  end
end
