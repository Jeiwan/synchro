module Synchro
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      config.synchro = ActiveSupport::OrderedOptions.new
      config.synchro.initialize_redis = false
    end

    initializer 'synchro.initialize_redis' do
      puts 'Initializing Synchro'
      Rails.logger.info 'Initializing Synchro'
      if config.synchro.initialize_redis
        puts 'Running Redis'
        Rails.logger.info 'Running Redis'
        config.synchro.initialized = true
      end
    end
  end
end
