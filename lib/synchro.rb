module Synchro
  def synchro
    after_create :synchro_synchronize

    include InstanceMethods
  end

  module InstanceMethods
    def synchro_synchronize
      Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>> YAY <<<<<<<<<<<<<<<<<<<<<<<<"
    end

    private :synchro_synchronize
  end
end

ActiveRecord::Base.send :extend, Synchro
