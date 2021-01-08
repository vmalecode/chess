require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'

myboard = ChessBoard.new
myboard.set_pieces


#myboard.move_piece(1,0,2,1)
#board array syntax is [row][column]

myboard.add_black_pawn(5,0)
myboard.add_black_pawn(5,2)
myboard.add_black_rook(3,3)
#myboard.print_board
myboard.get_board_string
#myboard.board_array[3][3].rook_scan(myboard.board_array)
#a=myboard.board_array[3][3].moves

a=myboard.board_string
puts "#{a}"
puts "hi"

