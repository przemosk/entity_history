# frozen_string_literal: true

require_relative "entity_history/version"
require "rails"
require "rails_event_store"
require "entity_history/events/created"
require "entity_history/events/updated"
require "entity_history/events/destroyed"
require "entity_history/events/handler"
require_relative "../app/models/concerns/entity_events"

module EntityHistory
  extend ActiveSupport::Concern
  class Error < StandardError; end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def log_entity_changes
      after_commit :notify_created_event, on: :create
      after_commit :notify_updated_event, on: :update
      after_commit :notify_destroyed_event, on: :destroy, prepend: true
    end
  end


  def display_entity_history
    event_store.read.stream("#{self.class.name}_#{self.id}").to_a
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

ActiveRecord::Base.prepend EntityHistory
