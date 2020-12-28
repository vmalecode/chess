require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'

myboard = ChessBoard.new

myboard.print_board
a=String.colors
puts "#{a}"
