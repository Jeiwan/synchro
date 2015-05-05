require 'synchro/railtie' if defined? Rails
require 'synchro/service_runner'
require 'synchro/nsq'
require 'krakow'
require 'logger'

module Synchro
  def synchro
    after_create :synchro_synchronize

    include InstanceMethods
  end

  module InstanceMethods
    def synchro_synchronize
      prepared_data = Synchro::ServiceRunner.new(self).prepare_data
      Synchro::NSQ.new(sender: self.class.name).post_message(prepared_data)
    end

    private :synchro_synchronize
  end
end

ActiveRecord::Base.send :extend, Synchro
