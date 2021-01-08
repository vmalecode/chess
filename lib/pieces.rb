require 'colorize'
class Piece
@@total_pieces=0
    def initialize()
        @move_count=0
        #@position = push(position)
        @taken=false
        @@total_pieces+=1
        @attacking=[]
        @moves=[]
    end
    def change_position(row,column)
        @r = row
        @c = column
        @position = [[row],[column]]
        @move_count+=1
    end
    def rook_scan(board_array) #scans up,down,left, right. returns squares that a rook could move to
        right_scan(board_array)
        left_scan(board_array)
        up_scan(board_array)
        down_scan(board_array)
    end
    def right_scan(board_array) #scans right, returns moves
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c+@i)>7
            @square = board_array[@r][@c+@i]
            if @square==" " 
                @moves.push([@r,@c+@i])
            elsif @square.color != self.color 
                @moves.push([@r,@c+@i])
                @attacking.push([@r,@c+@i]) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def left_scan(board_array)
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c-@i)<0 
            @square = board_array[@r][@c-@i]
            if @square==" " 
                @moves.push([@r,@c-@i])
            elsif @square.color != self.color 
                @moves.push([@r,@c-@i])
                @attacking.push([@r,@c-@i]) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def down_scan(board_array)
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@r+@i)>7 
            @square = board_array[@r+@i][@c]
            if @square==" " 
                @moves.push([@r+@i,@c])
            elsif @square.color != self.color 
                @moves.push([@r+@i,@c])
                @attacking.push([@r+@i,@c]) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def up_scan(board_array)
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@r-@i)<0 
            @square = board_array[@r-@i][@c]
            if @square==" " 
                @moves.push([@r-@i,@c])
            elsif @square.color != self.color 
                @moves.push([@r-@i,@c])
                @attacking.push([@r-@i,@c]) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end



    attr_accessor :r,:c,:valid_moves,:color,:moves
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
        @move_count=0
    end
    def get_valid_moves(board_array)
        @valid_moves=[]
        @attacking=[]
        if board_array[@r-1][@c]==" "
            @valid_moves.push([@r-1,@c])
        end
        if board_array[@r-2][@c]==" " && board_array[@r-1][@c]==" " && @move_count==0
            @valid_moves.push([@r-2,@c])
        end

        if board_array[@r-1][@c-1] != " " && board_array[@r-1][@c-1].color =="black"
            @valid_moves.push([@r-1,@c-1])
            @attacking.push([@r-1,@c-1])
        end
        @x=board_array[@r+1][@c+1]
        @y=board_array[@r+1][@c+1].color
        @y=board_array[@r+1][@c+1].color

        if board_array[@r-1][@c+1] != " " && board_array[@r-1][@c+1].color =="black"
            @valid_moves.push([@r-1,@c+1])
            @attacking.push([@r-1,@c+1])
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
        @type = "rook"
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
        @moves=[]
        @attacking=[]
    end
    attr_reader :symbol,:color,:moves
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