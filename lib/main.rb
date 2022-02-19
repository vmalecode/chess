require_relative '../lib/pieces.rb'
require_relative '../lib/board.rb'
require 'colorize'
require_relative '../lib/game.rb'

myGame=Game.new
myGame.myboard.print_board
myGame.play
