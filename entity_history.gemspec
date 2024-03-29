# frozen_string_literal: true

require_relative "lib/entity_history/version"

Gem::Specification.new do |spec|
  spec.name = "entity_history"
  spec.version = EntityHistory::VERSION
  spec.authors = ["Przemek Kosakowski (przemosk)"]
  spec.email = ["p.kosakowski@gmail.com"]

  spec.summary = "This is a tool that will help you keep track of changes related to your models."
  spec.description = "This is a tool that will help you keep track of changes related to your models."
  spec.homepage = "http://github.com/przemosk"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"] = "https://github.com/przemosk/entity_history"
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # TODO: consider versions
  spec.add_dependency "rails"
  spec.add_dependency "rails_event_store"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
