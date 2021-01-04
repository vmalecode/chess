require 'colorize'
class Piece
@@total_pieces=0
    def initialize()
        @move_count=0
        #@position = push(position)
        @taken=false
        @@total_pieces+=1
    end
    def change_position(row,column)
    @r = row
    @c = column
    @position = [[row],[column]]
    end
    attr_accessor :r,:c
end
class BlackPawn < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♙"
        @r=r
        @c=c
        @position=[[r],[c]]
        @move_count=0
        @valid_moves=[]
        @attacking=[]
    end
    def get_valid_moves(board_array)
        if board_array[@r+1][@c]==" "
            @valid_moves.push([@r+1,@c])
        end
        if board_array[@r+2][@c]==" " && board_array[@r+1][@c]==" " && @move_count==0
            @valid_moves.push([@r,@c+2])
        end
        if board_array[@r+1][@c+1] != " " && board_array[@r+1][@c+1].color =="white"
            @valid_moves.push([@r+1][@c+1])
            @attacking.push([@r+1][@c+1])
        end
        if board_array[@r+1][@c-1] != " " && board_array[@r+1][@c-1].color =="white"
            @valid_moves.push([@r+1][@c-1])
            @attacking.push([@r+1][@c-1])
        end
    end

    attr_reader :symbol,:color
end
class WhitePawn < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♟︎"
        @r=r
        @c=c
        @position=[[r],[c]]
        @valid_moves=[]
        @attacking=[]
    end
    def get_valid_moves(board_array)
        @valid_moves=[]
        @attacking=[]
        if board_array[@r-1][@c]==" "
            @valid_moves.push([@r-1,@c])
        end
        if board_array[@r-2][@c]==" " && board_array[@r-1][@c]==" " && @move_count==0
            @valid_moves.push([@r,@c+2])
        end
        if board_array[@r-1][@c-1] != " " && board_array[@r-1][@c-1].color =="black"
            @valid_moves.push([@r+1][@c+1])
            @attacking.push([@r+1][@c+1])
        end
        if board_array[@r+1][@c-1] != " " && board_array[@r+1][@c-1].color =="black"
            @valid_moves.push([@r+1][@c-1])
            @attacking.push([@r+1][@c-1])
        end
    end
    attr_reader :symbol,:color
end

class WhiteRook < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♜"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class WhiteKnight < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♞"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class WhiteBishop < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♝"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class WhiteKing < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♚"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class WhiteQueen < Piece
    def initialize(r,c)
        @color ="white" 
        @symbol="♛"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end

class BlackRook < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♖"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class BlackKnight < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♘"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class BlackBishop < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♙"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class BlackKing < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♔"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end
class BlackQueen < Piece
    def initialize(r,c)
        @color ="black" 
        @symbol="♕"
        @r=r
        @c=c
        @position=[[r],[c]]
    end
    attr_reader :symbol,:color
end