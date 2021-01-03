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
    def initialize(position)
        @color ="black" 
        @symbol="♙"
        @position=position
        @move_count=0
        @valid_moves=[]
    end
    def get_valid_moves(board_array)
        @valid_moves=[]
        if @move_count==0 && board_array[@position+8]== " " && board_array[@position+16]== " "
            @valid_moves.push(@position+16)
        end
        if board_array[@position+8]==" "
            @valid_moves.push(@position+8)
        end
        if board_array[@position+7]!=" "
            @valid_moves.push(@position+7)
        end
        if board_array[@position+9]!=" "
            @valid_moves.push(@position+9)
        end
    end

    attr_reader :symbol
end
class WhitePawn < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♟︎"
        @position=position
    end
    attr_reader :symbol
end

class WhiteRook < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♜"
        @position=position
    end
    attr_reader :symbol
end
class WhiteKnight < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♞"
        @position=position
    end
    attr_reader :symbol
end
class WhiteBishop < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♝"
        @position=position
    end
    attr_reader :symbol
end
class WhiteKing < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♚"
        @position=position
    end
    attr_reader :symbol
end
class WhiteQueen < Piece
    def initialize(position)
        @color ="white" 
        @symbol="♛"
        @position=position
    end
    attr_reader :symbol
end

class BlackRook < Piece
    def initialize(position)
        @color ="black" 
        @symbol="♖"
        @position=position
    end
    attr_reader :symbol
end
class BlackKnight < Piece
    def initialize(position)
        @color ="black" 
        @symbol="♘"
        @position=position
    end
    attr_reader :symbol
end
class BlackBishop < Piece
    def initialize(position)
        @color ="black" 
        @symbol="♙"
        @position=position
    end
    attr_reader :symbol
end
class BlackKing < Piece
    def initialize(position)
        @color ="black" 
        @symbol="♔"
        @position=position
    end
    attr_reader :symbol
end
class BlackQueen < Piece
    def initialize(position)
        @color ="black" 
        @symbol="♕"
        @position=position
    end
    attr_reader :symbol
end