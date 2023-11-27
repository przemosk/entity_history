# frozen_string_literal: true

module EntityHistory
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Creates a EntityHistory initializer in your application."

    def copy_initializer
      template "entity_history.rb", "config/initializers/entity_history.rb"
    end
  end
end
