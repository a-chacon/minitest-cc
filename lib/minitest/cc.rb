# frozen_string_literal: true

require 'minitest'

require_relative 'cc/version'
require_relative 'cc/reporter'
require_relative 'cc/file_coverage'
require_relative 'cc/file_array'

module Minitest
  # Main module of the plugin
  # @author Andres
  module Cc
    @results = []
    @files = FileArray.new

    def self.cattr_accessor(name) # :nodoc:
      (class << self; self; end).attr_accessor name
    end

    # @return [Symbol] mode of the summary. Could be :resume or :per_file
    cattr_accessor :cc_mode
    self.cc_mode = :resume

    # @return [Array] pattern to find files that must be cover by the tests
    cattr_accessor :tracked_files
    self.tracked_files = [
      './app/**/*.rb',
      './lib/**/*.rb'
    ]

    # @return [Array] mode of the coverage, this array could contain:
    #   :lines, :branches, :methods
    cattr_accessor :coverage_mode
    self.coverage_mode = %i[
      lines
      branches
      methods
    ]

    class << self
      ##
      # Start the coverage process
      # @see https://runebook.dev/en/docs/ruby/coverage Coverage blog post explaining the use
      # @see https://ruby-doc.org/stdlib-2.7.6/libdoc/coverage/rdoc/Coverage.html Documentation of the module
      def start_coverage
        require 'coverage'
        Coverage.start(coverage_mode.collect { |m| [m, true] }.to_h)
      end

      ##
      # Print the results after the runs
      def summary
        @results = Coverage.peek_result
        list_files
        puts "\n\n# Coverage:\n\n"
        @files.each { |f| puts f.to_s } if cc_mode == :per_file
        puts resume if cc_mode == :resume
        puts
      rescue NameError
        puts "\n\n[!] cc extension is installed but was not started."
      end

      ##
      # This method populate the FileArray variable with results
      def list_files
        Dir.glob(tracked_files.each { |f| File.expand_path(f) }).each do |d|
          full_path = File.expand_path(d)
          @files << FileCoverage.new(full_path, d, result_for_file(full_path))
        end
      end

      ##
      # Find the result for a file with the full path
      # if the file was not tracked by Coverage this will return nil
      # @param file_path [String] Absolute path to the file
      # @return [Hash, nil] Object with all the results for the selected file or nil
      def result_for_file(file_path)
        return if @results.empty?

        @results[file_path]
      end

      ##
      # compose the string with resume of averages
      # @return [String] String with averages
      def resume
        str = ''
        str += "lines: #{@files.lines_average.to_s_color}%\t" if coverage_mode.include? :lines
        str += "branches: #{@files.branches_average.to_s_color}%\t" if coverage_mode.include? :branches
        str += "methods: #{@files.methods_average.to_s_color}%\t" if coverage_mode.include? :methods
        str
      end
    end
  end
end

class String # :nodoc:
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end

class Integer # :nodoc:
  def to_s_color
    case self
    when 1..33
      to_s.red
    when 34..66
      to_s.yellow
    when 67..100
      to_s.green
    else
      to_s
    end
  end
end
