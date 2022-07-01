# frozen_string_literal: true

module Minitest
  module Cc
    # Reporter class extend of Minitest Reporter
    class Reporter < Minitest::AbstractReporter
      ##
      # Executed in the final of the minitest run
      def report
        Cc.summary
      end
    end
  end
end
