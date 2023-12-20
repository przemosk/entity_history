# frozen_string_literal: true

module EntityHistory
  module Serializers
    class EntityHistorySerializer < EntityHistory::Serializers::BaseSerializer
      def serializable_hash
        return collection if options[:raw]

        collection.map do |item|
          {
            action: display_action_name(item.class.name),
            event_id: item.event_id,
            attributes: item.data[:attributes],
            changes: unfold_changes(item.data[:changes])
          }
        end
      end
    end
  end
end
