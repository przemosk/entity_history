# frozen_string_literal: true

require "spec_helper"

RSpec.describe EntityHistory do
  it "has a version number" do
    expect(EntityHistory::VERSION).not_to be nil
  end

  describe "#display_entity_history" do
    # TODO
  end

  describe ".log_entity_history" do
    # TODO
  end
end
