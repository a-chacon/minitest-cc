# frozen_string_literal: true

require 'coverage'
require 'minitest'
require 'minitest/cc'

# Minitest module
module Minitest
  # Init method called from minitest
  # it start the plugin
  def self.plugin_cc_init(_options)
    # insert ower reporter to minitest reporters
    reporter << Minitest::Cc::Reporter.new
  rescue StandardError
    puts 'The coverage plugin cannot be initialized.'
  end
end
