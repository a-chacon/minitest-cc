# frozen_string_literal: true
require 'minitest/cc'
# Minitest::Cc.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)


require 'minitest/autorun'

module Minitest
  def self.a_result
    {
      lines: [1, 1, nil, nil, 1, 1, nil, 1, 1, 1, 1, nil, nil, nil, nil, 1, nil, 1, nil, nil, nil, 1, 1, 1, 0, 0, nil, 0,
              nil, nil, 1, nil, nil, nil, nil, nil, 1, 1, 1, nil, nil, nil, nil, nil, nil, 1, 0, 0, 0, nil, nil, nil, nil, nil, nil, nil, nil, 1, 1, 1, nil, 0, 0, 0, 0, 0, 0, 0, 0, nil, 0, nil, nil, nil, 1, 1, nil, nil, nil, nil, nil, 1, nil, 0, nil, 0, nil, nil, nil, nil, nil, nil, nil, 1, 1, nil, nil, nil, nil, nil, nil, 1, 1, nil, nil, nil, nil, nil, 1, 1, 1, nil, 0, nil, nil, nil, nil, nil, nil, nil, 1, 1, 1, nil, nil, nil, nil], branches: { [:if, 0, 25, 10, 28, 22] => { [:then, 1, 26, 12, 26, 32] => 0, [:else, 2, 28, 12, 28, 22] => 0 }, [:if, 3, 22, 10, 29, 13] => { [:then, 4, 23, 12, 24, 26] => 1, [:else, 5, 25, 10, 28, 22] => 0 }, [:unless, 6, 69, 14, 69, 51] => { [:else, 7, 69, 14, 69, 51] => 0, [:then, 8, 69, 14, 69, 19] => 0 }, [:if, 9, 60, 8, 77, 11] => { [:then, 10, 62, 10, 72, 13] => 0, [:else, 11, 75, 10, 76, 42] => 1 }, [:if, 12, 110, 8, 114, 11] => { [:then, 13, 111, 10, 111, 78] => 1, [:else, 14, 113, 10, 113, 103] => 0 } }, methods: { ['Mytotp::Commands::Generate', :copy_to_clipboard, 121, 6, 124, 9] => 1, ['Mytotp::Commands::Generate', :message_code, 109, 6, 115, 9] => 1, ['Mytotp::Commands::Generate', :message_valid_for, 102, 6, 104, 9] => 1, ['Mytotp::Commands::Generate', :valid_for, 94, 6, 96, 9] => 1, ['Mytotp::Commands::Generate', :clear_last_line, 82, 6, 87, 9] => 0, ['Mytotp::Commands::Generate', :generate_code, 58, 6, 78, 9] => 1, ['Mytotp::Commands::Generate', :select_one, 46, 6, 52, 9] => 0, ['Mytotp::Commands::Generate', :found_one_message, 37, 6, 40, 9] => 1, ['Mytotp::Commands::Generate', :call, 16, 6, 32, 9] => 1 }
    }
  end
end
