# frozen_string_literal: true

require 'test_helper'

module Minitest
  module Cc
    class TestFileArray < Minitest::Test
      def setup
        @array = Minitest::Cc::FileArray.new()
        @array << Minitest::Cc::FileCoverage.new(
          '/home/user/app/controllers/rails_url_shortener/urls_controller.rb',
          './app/controllers/rails_url_shortener/urls_controller.rb',
          Minitest.a_result
        )
        @array << Minitest::Cc::FileCoverage.new(
          '/home/user/app/controllers/rails_url_shortener/urls_controller.rb',
          './app/controllers/rails_url_shortener/urls_controller.rb',
          Minitest.a_result
        )
      end

      def test_lines_average
        assert_equal 65.38461538461539, @array.lines_average
      end

      def test_branches_average
        assert_equal 30, @array.branches_average
      end

      def test_methods_average
        assert_equal 77.77777777777777, @array.methods_average
      end
    end
  end
end
