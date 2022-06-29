# frozen_string_literal: true

require 'test_helper'

module Minitest
  class TestCc < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Minitest::Cc::VERSION
    end

    def test_default_values
      assert_equal :resume, Minitest::Cc.cc_mode
      assert_equal :resume, Minitest::Cc.cc_mode
    end
  end
end
