require 'krakow'

module Synchro
  def synchro
    after_create :synchro_synchronize

    include InstanceMethods
  end

  module InstanceMethods
    def synchro_synchronize
      Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>> #{self.class.inspect} <<<<<<<<<<<<<<<<<<<<<<<<"
      prepared_data = Synchro::ServiceRunner.new(self.class).prepare_data
      Synchro::NSQ.new.post_message(prepared_data)
    end

    private :synchro_synchronize
  end
end

ActiveRecord::Base.send :extend, Synchro
