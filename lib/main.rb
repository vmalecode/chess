require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'

myboard = ChessBoard.new
myboard.set_pieces
myboard.print_board
#a=String.colors
a=myboard.board_array[8].get_valid_moves(myboard.board_array)

#wpwn = WhitePawn.new()
puts "valid moves : #{a}"
puts "hi"
