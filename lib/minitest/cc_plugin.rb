# frozen_string_literal: true

require 'minitest/cc'

# Minitest module
module Minitest
  # Init method called from minitest
  # it start the plugin
  def self.plugin_cc_init(_options)
    # insert ower reporter to minitest reporters
    reporter << Minitest::Cc::Reporter.new
  end
end
