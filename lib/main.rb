require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'

myboard = ChessBoard.new
myboard.set_pieces
myboard.print_board

myboard.board_array[1][0].get_valid_moves(myboard.board_array)
myboard.move_piece(1,0,2,1)
#board array [row][column]
myboard.print_board

puts "hi"
