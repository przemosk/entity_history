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
  class Error < StandardError; end

  def log_entity_history; end
end

ActiveRecord::Base.extend EntityHistory