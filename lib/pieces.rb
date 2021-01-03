require 'colorize'
class Piece
@@total_pieces=0
    def initialize()
        @move_count=0
        #@position = push(position)
        @taken=false
        @@total_pieces+=1
    end
end
class BlackPawn < Piece
    def initialize()
        @color ="black" 
        @symbol="♟︎"
    end
    attr_reader :symbol
end
class WhitePawn < Piece
    def initialize()
        @color ="white" 
        @symbol="♙"
    end
    attr_reader :symbol
end