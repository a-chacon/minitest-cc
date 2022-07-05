# frozen_string_literal: true

require 'test_helper'

module Minitest
  class TestCc < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Minitest::Cc::VERSION
    end

    def test_start_coverage
      assert_nil Cc.start
    end

    def test_peek_result
      Cc.start
      assert Cc.peek_result
      assert_equal String, Cc.resume.class
    end

    def test_result_for_file_whitout_results
      assert_nil Cc.result_for_file('/test.rb')
    end
  end
end
