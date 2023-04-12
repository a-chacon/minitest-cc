# frozen_string_literal: true

require 'test_helper'

module Minitest
  module Cc
    class TestFileCoverage < Minitest::Test

      def setup
        @file_coverage = Minitest::Cc::FileCoverage.new(
          '/home/user/app/controllers/rails_url_shortener/urls_controller.rb',
          './app/controllers/rails_url_shortener/urls_controller.rb',
          Minitest.a_result
        )
      end

      def test_initialize
        assert Minitest::Cc::FileCoverage.new(
          '/home/user/app/controllers/rails_url_shortener/urls_controller.rb',
          './app/controllers/rails_url_shortener/urls_controller.rb',
          Minitest.a_result
        )
      end

      def test_to_s
        assert_includes @file_coverage.to_s, @file_coverage.relative_path
        @file_coverage.tested = false
        assert_includes @file_coverage.to_s, @file_coverage.relative_path
        @file_coverage.tested = true
      end

      def test_lines_percent
        assert_equal 65.38461538461539, @file_coverage.lines_percent
      end

      def test_branches_percent
        assert_equal 30, @file_coverage.branches_percent
      end

      def test_methods_percent
        assert_equal 77.77777777777777, @file_coverage.methods_percent
      end
    end
  end
end
