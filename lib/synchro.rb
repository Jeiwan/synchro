require 'synchro/service_runner'
require 'synchro/nsq'
require 'krakow'

module Synchro
  def synchro
    after_create :synchro_synchronize

    include InstanceMethods
  end

  module InstanceMethods
    def synchro_synchronize
      Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>> #{self.class.inspect} <<<<<<<<<<<<<<<<<<<<<<<<"
      prepared_data = Synchro::ServiceRunner.new(self).prepare_data
      Synchro::NSQ.new.post_message(prepared_data, self.class.name)
    end

    private :synchro_synchronize
  end
end

ActiveRecord::Base.send :extend, Synchro
