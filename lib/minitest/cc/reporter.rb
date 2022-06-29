# frozen_string_literal: true

require 'minitest'

module Minitest
  module Cc
    # Reporter class extend of Minitest Reporter
    # this get 5 important methods from the parent
    # but we use only 2
    class Reporter < Minitest::AbstractReporter
      ##
      # Executed in the beginin of the minitest run
      def start
        Cc.start_coverage
      end

      ##
      # Executed in the final of the minitest run
      def report
        Cc.summary
      end
    end
  end
end
