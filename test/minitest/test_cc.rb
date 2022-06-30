# frozen_string_literal: true

require 'test_helper'

module Minitest
  class TestCc < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Minitest::Cc::VERSION
    end

    def test_default_values
      assert_equal :resume, Minitest::Cc.cc_mode
      assert_equal [
        './app/**/*.rb',
        './lib/**/*.rb'
      ], Minitest::Cc.tracked_files
      assert_equal [:lines, :branches, :methods], Minitest::Cc.coverage_mode
    end

    def test_start_coverage
      assert_nil Minitest::Cc.start_coverage
    end
  end
end
