module Wupee
  module NotificationAttachedObject
    extend ActiveSupport::Concern

    included do
      after_destroy :clean_notification

      def clean_notification
        Notification.where('attached_object_id = :id and attached_object_type = :type', {id: id, type: self.class.to_s})
                      .destroy_all
      end
    end
  end
end
