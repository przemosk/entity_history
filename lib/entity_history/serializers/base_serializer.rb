# frozen_string_literal: true

module EntityHistory
  module Serializers
    class BaseSerializer
      # TODO: introduce serializer library
      def initialize(collection: [], options: {})
        @collection = collection
        @options = options
      end

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

      private

      attr_reader :collection, :options

      def unfold_changes(changed_attributes)
        changed_attributes.map { |attribute, value| { attribute => { from: value[0], to: value[1] } } }
      end

      def display_action_name(class_name)
        case class_name.to_s
        when "EntityHistory::Events::Created" then "create"
        when "EntityHistory::Events::Updated" then "update"
        when "EntityHistory::Events::Destroyed" then "destroy"
        else class_name.to_s.split("::").last
        end
      end
    end
  end
end
