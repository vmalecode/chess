class BlackRook < Piece
    def initialize()
        @color ="black" 
        @symbol="♜"
    end
    attr_reader :symbol
end
class BlackKnight < Piece
    def initialize()
        @color ="black" 
        @symbol="♞"
    end
    attr_reader :symbol
end
class BlackBishop < Piece
    def initialize()
        @color ="black" 
        @symbol="♝"
    end
    attr_reader :symbol
end
class BlackKing < Piece
    def initialize()
        @color ="black" 
        @symbol="♚"
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