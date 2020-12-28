require 'colorize'
class Piece
    def initialize(color,position)
        @color = color
        @move_count=0
        @position = push(position)
    end
end

class Pawn < Piece
    def initialize
    
    end


end
