# frozen_string_literal: true

Rails.configuration.to_prepare do
  Rails.configuration.event_store = event_store = RailsEventStore::Client.new
  event_store.subscribe(
    EntityHistory::Events::Handler.new,
    to: [
      EntityHistory::Events::Created,
      EntityHistory::Events::Updated,
      EntityHistory::Events::Destroyed
    ]
  )
end
