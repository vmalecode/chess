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
        @symbol="♙"
        @position=position
    end
    attr_reader :symbol
end
class WhitePawn < Piece
    def initialize()
        @color ="white" 
        @symbol="♟︎"
    end
    attr_reader :symbol
end

class WhiteRook < Piece
    def initialize()
        @color ="white" 
        @symbol="♜"
    end
    attr_reader :symbol
end
class WhiteKnight < Piece
    def initialize()
        @color ="white" 
        @symbol="♞"
    end
    attr_reader :symbol
end
class WhiteBishop < Piece
    def initialize()
        @color ="white" 
        @symbol="♝"
    end
    attr_reader :symbol
end
class WhiteKing < Piece
    def initialize()
        @color ="white" 
        @symbol="♚"
    end
    attr_reader :symbol
end
class WhiteQueen < Piece
    def initialize()
        @color ="white" 
        @symbol="♛"
    end
    attr_reader :symbol
end

class BlackRook < Piece
    def initialize()
        @color ="black" 
        @symbol="♖"
    end
    attr_reader :symbol
end
class BlackKnight < Piece
    def initialize()
        @color ="black" 
        @symbol="♘"
    end
    attr_reader :symbol
end
class BlackBishop < Piece
    def initialize()
        @color ="black" 
        @symbol="♙"
    end
    attr_reader :symbol
end
class BlackKing < Piece
    def initialize()
        @color ="black" 
        @symbol="♔"
    end
    attr_reader :symbol
end
class BlackQueen < Piece
    def initialize()
        @color ="black" 
        @symbol="♕"
    end
    attr_reader :symbol
end