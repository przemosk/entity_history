# frozen_string_literal: true

module EntityEvents
  extend ActiveSupport::Concern
  include ActiveModel::Dirty

  included do
    after_commit :notify_created_event, on: :create
    after_commit :notify_updated_event, on: :update
    after_commit :notify_destroyed_event, on: :destroy, prepend: true
  end

  private

  def notify_created_event
    publish_event(
      event: EntityHistory::Events::Created.new(data: { attributes: attributes, changes: previous_changes }),
      stream_name: "#{self.class.name}_#{id}"
    )
  end

  def notify_updated_event
    publish_event(
      event: EntityHistory::Events::Updated.new(data: { attributes: attributes, changes: previous_changes }),
      stream_name: "#{self.class.name}_#{id}"
    )
  end

  def notify_destroyed_event
    publish_event(
      event: EntityHistory::Events::Destroyed.new(data: { attributes: attributes, changes: previous_changes }),
      stream_name: "#{self.class.name}_#{id}"
    )
  end

  def publish_event(event:, stream_name:)
    event_store.publish(event, stream_name: stream_name)
  end

  def event_store
    RailsEventStore::Client.new
  end
end
