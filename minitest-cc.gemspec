# frozen_string_literal: true

require_relative "lib/minitest/cc/version"

Gem::Specification.new do |spec|
  spec.name = "minitest-cc"
  spec.version = Minitest::Cc::VERSION
  spec.authors = ["a-chacon"]
  spec.email = ["andres.ch@protonmail.com"]

  spec.summary = "Small code coverage"
  spec.description = "Small code coverage."
  spec.homepage = "https://a-chacon.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://a-chacon.com"
  spec.metadata["changelog_uri"] = "https://a-chacon.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob('lib/**/*.rb')
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
