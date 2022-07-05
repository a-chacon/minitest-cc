# frozen_string_literal: true

module Minitest
  module Cc
    # Reporter class extend of Minitest Reporter
    class Reporter < Minitest::AbstractReporter
      ##
      # Executed in the final of the minitest run
      def report
        Cc.peek_result
        Cc.summary
      rescue StandardError => e
        puts "\n\n[!] cc extension has problem for generate the report: #{e}"
      end
    end
  end
end
