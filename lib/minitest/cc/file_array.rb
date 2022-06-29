# frozen_string_literal: true

module Minitest
  module Cc
    # model for a file
    class FileArray < Array
      ##
      # Calculate the lines average of the self array
      # @return [Integer] percent of lines executed
      def lines_average
        lines = reduce(0) { |sum, v| sum + v.lines.to_i }
        lines_executed = reduce(0) { |sum, v| sum + v.lines_executed.to_i }
        lines_executed * 100 / lines
      rescue ZeroDivisionError
        0
      end

      ##
      # Calculate the branches average of the self array
      # @return [Integer] percent of branches executed
      def branches_average
        branches = reduce(0) { |sum, v| sum + v.branches.to_i }
        branches_executed = reduce(0) { |sum, v| sum + v.branches_executed.to_i }
        branches_executed * 100 / branches
      rescue ZeroDivisionError
        0
      end

      ##
      # Calculate the methods average of the self array
      # @return [Integer] percent of methods executed
      def methods_average
        methods = reduce(0) { |sum, v| sum + v.methods.to_i }
        methods_executed = reduce(0) { |sum, v| sum + v.methods_executed.to_i }
        methods_executed * 100 / methods
      rescue ZeroDivisionError
        0
      end
    end
  end
end
