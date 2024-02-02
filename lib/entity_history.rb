# frozen_string_literal: true

require_relative "entity_history/version"
require "rails"
require "rails_event_store"
require "entity_history/configuration"
require "entity_history/events/created"
require "entity_history/events/updated"
require "entity_history/events/destroyed"
require "entity_history/events/handler"
require "entity_history/serializers/base_serializer"
require "entity_history/serializers/entity_history_serializer"

module EntityHistory
  extend ActiveSupport::Concern

  module ClassMethods
    def log_entity_history
      after_commit :notify_created_event, on: :create
      after_commit :notify_updated_event, on: :update
      after_commit :notify_destroyed_event, on: :destroy, prepend: true
    end

    def find_destroyed_entity(entity_id:); end

    def restore_entity(attributes: {}); end
  end

  def display_entity_history(**opts)
    serialized_entity_stream(collection: event_store.read.stream(stream_label).to_a, **opts)
  end

  private

  def notify_created_event
    publish_event(
      event: EntityHistory::Events::Created.new(data: { attributes: attributes, changes: previous_changes })
    )
  end

  def notify_updated_event
    publish_event(
      event: EntityHistory::Events::Updated.new(data: { attributes: attributes, changes: previous_changes })
    )
  end

  def notify_destroyed_event
    publish_event(
      event: EntityHistory::Events::Destroyed.new(data: { attributes: attributes, changes: {} })
    )
  end

  def allowed_attributes
    # TODO: list attributes which should be tracked, consider pass by configuration for flexibility
    # TODO: check STI case
  end

  def serialized_entity_stream(collection: [], **opts)
    EntityHistory::Configuration.default_serializer_klass.new(collection: collection, options: opts).serializable_hash
  end

  def publish_event(event:)
    event_store.publish(event, stream_name: stream_label)
  end

  def stream_label
    "#{self.class.name}_#{id}"
  end

  def event_store
    RailsEventStore::Client.new
  end
end

ActiveRecord::Base.include EntityHistory
