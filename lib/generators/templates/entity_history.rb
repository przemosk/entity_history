# frozen_string_literal: true

Rails.configuration.to_prepare do
  Rails.configuration.event_store = event_store = ::RailsEventStore::Client.new
  event_store.subscribe(
    EntityHistory::Events::EntityHandler.new,
    to: [
      EntityHistory::Events::EntityCreated,
      EntityHistory::Events::EntityUpdated,
      EntityHistory::Events::EntityDestroyed
    ]
  )
end
