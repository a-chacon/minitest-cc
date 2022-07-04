# frozen_string_literal: true

require 'minitest/cc'

# Minitest module
module Minitest
  # Init method called from minitest
  def self.plugin_cc_init(_options)
    reporter << Minitest::Cc::Reporter.new if Coverage.running?
  end
end
