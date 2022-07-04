# frozen_string_literal: true

require_relative 'lib/minitest/cc/version'

Gem::Specification.new do |spec|
  spec.name = 'minitest-cc'
  spec.version = Minitest::Cc::VERSION
  spec.authors = ['a-chacon']
  spec.email = ['andres.ch@protonmail.com']

  spec.summary = 'Minitest plugin, add code coverage metrics.'
  spec.description = 'Plugin for minitest, provide a minimal information of code coverage to your test output. '
  spec.homepage = 'https://github.com/a-chacon/minitest-cc'
  spec.license = 'GPL-3.0'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/a-chacon/minitest-cc/issues',
    'changelog_uri' => 'https://github.com/a-chacon/minitest-cc',
    'documentation_uri' => 'https://www.rubydoc.info/gems/minitest-cc',
    'homepage_uri' => 'https://github.com/a-chacon/minitest-cc',
    'source_code_uri' => 'https://github.com/a-chacon/minitest-cc'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob('lib/**/*.rb')
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
