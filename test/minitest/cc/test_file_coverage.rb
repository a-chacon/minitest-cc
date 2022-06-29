# frozen_string_literal: true

require 'test_helper'

module Minitest
  module Cc
    class TestFileCoverage < Minitest::Test
      def test_initialize
        assert Minitest::Cc::FileCoverage.new(
          '/home/user/app/controllers/rails_url_shortener/urls_controller.rb',
          './app/controllers/rails_url_shortener/urls_controller.rb',
          Minitest.a_result
        )
      end
    end
  end
end
