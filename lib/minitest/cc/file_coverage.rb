# frozen_string_literal: true

module Minitest
  module Cc
    # model for a file
    class FileCoverage
      # @return [String] the name of the file with extension
      attr_accessor :name
      # @return [String] the absolute path to the file
      attr_accessor :path
      # @return [String] the relative path to the file
      attr_accessor :relative_path
      # @return [Boolean] if this was tested or not.
      #  this indicate if the file was tracked by coverage or not
      attr_accessor :tested
      # @return [Integer] total lines of the file
      attr_accessor :lines
      # @return [Integer] total lines executed of the file
      attr_accessor :lines_executed
      # @return [Integer] total branches of the file
      attr_accessor :branches
      # @return [Integer] total branches executed of the file
      attr_accessor :branches_executed
      # @return [Integer] total methods of the file
      attr_accessor :methods
      # @return [Integer] total methods executed of the file
      attr_accessor :methods_executed

      ##
      # Initialize an instance of FileCoverage
      # @param path [String] full path to the file
      # @param relative_path [String] relative path to the file
      # @param result [Hash] object with the result of the coverage for the file
      def initialize(path, relative_path, result = nil)
        @path = path
        @relative_path = relative_path
        @name = File.basename(path)
        @tested = !result.nil?
        from_result(result) unless result.nil?
      end

      ##
      # Set the results of the coverage into the object variables
      # @param result [Hash] object with the result of the coverage
      def from_result(result)
        @lines, @lines_executed = count_lines(result) unless result[:lines].nil?
        @branches, @branches_executed = count_branches(result) unless result[:branches].nil?
        @methods, @methods_executed = count_methods(result) unless result[:methods].nil?
      end

      ##
      # count total lines and executed lines
      # @param result [Hash] object with the result of the coverage
      # @return [Array] Array with two values: First: the total lines. Second: the lines executed
      def count_lines(result)
        [result[:lines].count { |n| n.is_a? Integer }, result[:lines].count { |n| n.is_a?(Integer) && n != 0 }]
      end

      ##
      # count total branches and executed branches
      # @param result [Hash] object with the result of the coverage
      # @return [Array] Array with two values: First: the total branches. Second: the branches executed
      def count_branches(result)
        [
          result[:branches].values.reduce(0) { |sum, v| sum + v.size },
          result[:branches].values.reduce(0) { |sum, v| sum + v.values.reject(&:zero?).count }
        ]
      end

      ##
      # count total methods and executed methods
      # @param result [Hash] object with the result of the coverage
      # @return [Array] Array with two values: First: the total methods. Second: the methods executed
      def count_methods(result)
        [result[:methods].length, result[:methods].values.reject(&:zero?).count]
      end

      ##
      # Transform the object to a readable string
      # @return [String] contains the information ready to print
      def to_s
        if tested
          str = "#{relative_path}: \n lines: #{lines_executed}/#{lines} #{lines_percent}%"
          str += "\tbranches: #{branches_executed}/#{branches} #{branches_percent}%" if branches
          str += "\tmethods: #{methods_executed}/#{methods} #{methods_percent}%" if methods
          str
        else
          "#{relative_path} : Not executed during the tests."
        end
      end

      ##
      # Calculate the percent of coverage lines
      # @return [Integer] percent of coverage. executed lines / total lines
      def lines_percent
        lines_executed * 100 / lines
      rescue ZeroDivisionError
        0
      end

      ##
      # Calculate the percent of coverage branches
      # @return [Integer] percent of coverage. executed branches / total branches
      def branches_percent
        branches_executed * 100 / branches
      rescue ZeroDivisionError
        0
      end

      ##
      # Calculate the percent of coverage methods
      # @return [Integer] percent of coverage. executed methods / total methods
      def methods_percent
        methods_executed * 100 / methods
      rescue ZeroDivisionError
        0
      end
    end
  end
end
