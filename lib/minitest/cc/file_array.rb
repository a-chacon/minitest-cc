# frozen_string_literal: true

module Minitest
  module Cc
    # model for a file
    class FileArray < Array
      ##
      # Calculate the lines average of the self array
      # @return [Float] percent of lines executed
      def lines_average
        lines = reduce(0) { |sum, v| sum + v.lines.to_i }

        return 0.0 if lines.zero?

        lines_executed = reduce(0) { |sum, v| sum + v.lines_executed.to_i }
        lines_executed * 100.0 / lines
      end

      ##
      # Calculate the branches average of the self array
      # @return [Float] percent of branches executed
      def branches_average
        branches = reduce(0) { |sum, v| sum + v.branches.to_i }

        return 0.0 if branches.zero?

        branches_executed = reduce(0) { |sum, v| sum + v.branches_executed.to_i }
        branches_executed * 100.0 / branches
      end

      ##
      # Calculate the methods average of the self array
      # @return [Float] percent of methods executed
      def methods_average
        methods = reduce(0) { |sum, v| sum + v.methods.to_i }

        return 0.0 if methods.zero?

        methods_executed = reduce(0) { |sum, v| sum + v.methods_executed.to_i }
        methods_executed * 100.0 / methods
      end

      ##
      # Calculate total average of coverage
      # @return [Float] percent of coverage
      def total_coverage_percent
        (lines_average + branches_average + methods_average) / 3
      rescue ZeroDivisionError
        0.0
      end
    end
  end
end
