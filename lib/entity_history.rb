# frozen_string_literal: true

require_relative "entity_history/version"
require "rails"
require "rails_event_store"
require "entity_history/events/entity_created"
require "entity_history/events/entity_updated"
require "entity_history/events/entity_destroyed"
require "entity_history/events/entity_handler"
require_relative "../app/models/concerns/entity_events"

module EntityHistory
  class Error < StandardError; end

  def log_entity_history; end
end

ActiveRecord::Base.extend EntityHistory