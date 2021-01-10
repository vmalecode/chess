require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'
require_relative '../lib/game.rb'



myGame=Game.new
#myGame.myboard.print_board
#myGame.myboard.move_piece(6,0,4,0)
#myGame.myboard.print_board
myGame.play
