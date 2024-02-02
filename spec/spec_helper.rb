# frozen_string_literal: true

require "entity_history"
require "rspec"
require "rspec-rails"
require "factory_bot_rails"
require "ruby_event_store/rspec"

require 'dummy/config/environment'

ActiveRecord::Migration.maintain_test_schema!

ActiveRecord::Schema.verbose = false
load 'dummy/db/schema.rb'

FactoryBot.definition_file_paths = ["spec/factories"]

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
