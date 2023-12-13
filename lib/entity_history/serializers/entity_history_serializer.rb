# frozen_string_literal: true

module EntityHistory
  module Serializers
    class EntityHistorySerializer
      def initialize(collection: [])
        @collection = collection
      end

      def serializable_hash
        collection.map do |item|
          {
            action: item.class.name,
            event_id: item.event_id,
            attributes: item.data[:attributes],
            changes: item.data[:changes]
          }
        end
      end

      private

      attr_reader :collection
    end
  end
end
