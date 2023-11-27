# frozen_string_literal: true

RSpec.describe EntityHistory do
  it "has a version number" do
    expect(EntityHistory::VERSION).not_to be nil
  end
end
