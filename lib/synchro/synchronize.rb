module Synchro
  module Synchronize
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def synchronize
        after_create :synchro_synchronize

        include Synchro::Synchronize::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def synchro_synchronize
        Rails.logger.info ">>>>>>>>>>>>>>>>>> YAY! <<<<<<<<<<<<<<<<<<"
      end

      private :synchro_synchronize
    end
  end
end

ActiveRecord::Base.send :include, Synchro::Synchronize
