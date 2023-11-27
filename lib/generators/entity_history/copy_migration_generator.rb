# frozen_string_literal: true

module EntityHistory
  class CopyMigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path("../../templates", __FILE__)

    desc "Copy required database migration into Rails application"

    def self.next_migration_number(dirname)
      migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(migration_number)
    end

    def copy_migration
      # check if table exists here or in migration
      migration_template "migration.rb", "db/migrate/create_entity_history_tables.rb"
    end
  end
end
