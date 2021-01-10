require 'colorize'
class Piece
    @@total_pieces=0
    def initialize(board_array)
        @move_count=0
        #@position = push(position)
        @taken=false
        @@total_pieces+=1
        @attacking=[]
        @moves=[]
        @board_array=board_array
    end
    def change_position(row,column)
        @r = row
        @c = column
        @position = [row,column]
        @move_count+=1
    end
    def rook_scan() #scans up,down,left, right. returns squares that a rook could move to
        right_scan()
        left_scan()
        up_scan()
        down_scan()
    end
    def right_scan() #scans right, returns moves
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c+@i)>7
            @square = @board_array[@r][@c+@i]
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
    def left_scan()
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c-@i)<0 
            @square = @board_array[@r][@c-@i]
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
    def down_scan()
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@r+@i)>7 
            @square = @board_array[@r+@i][@c]
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
    def ur_diag_scan # scan up and right diagonal
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c+@i)>7
            break if (@r-@i)<0
            @square = @board_array[@r-@i][@c+@i]
            @square_coordinates = [@r-@i,@c+@i]
            if @square==" " 
                @moves.push(@square_coordinates)
            elsif @square.color != self.color 
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def up_scan
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@r-@i)<0 
            @square = @board_array[@r-@i][@c]
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
    def ul_diag_scan # scan up and left diagonal
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c-@i)<0
            break if (@r-@i)<0
            @square = @board_array[@r-@i][@c-@i]
            @square_coordinates = [@r-@i,@c-@i]
            if @square==" " 
                @moves.push(@square_coordinates)
            elsif @square.color != self.color 
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def dl_diag_scan # scan down and left diagonal
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c-@i)<0
            break if (@r+@i)>7
            @square = @board_array[@r+@i][@c-@i]
            @square_coordinates = [@r+@i,@c-@i]
            if @square==" " 
                @moves.push(@square_coordinates)
            elsif @square.color != self.color 
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def dr_diag_scan # scan down and right diagonal
        @continue = 1
        @i=1
        while @continue !=0 
            break if (@c+@i)>7
            break if (@r+@i)>7
            @square = @board_array[@r+@i][@c+@i]
            @square_coordinates = [@r+@i,@c+@i]
            if @square==" " 
                @moves.push(@square_coordinates)
            elsif @square.color != self.color 
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates) 
            end
            if @square!=" "
                @continue=0
            end
        @i+=1
        end
    end
    def knight_scan()
        @knight_moves=[[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
        @knight_moves.each do |move|
            @square=nil
            @x = @board_array[1][1]
            @a=move[0]+@r
            @b=move[1]+@c
            next move if @a>7 || @a<0 ||@b>7||@b<0
            @square = @board_array[move[0]+@r][move[1]+@c]
            @square_coordinates = [move[0]+@r,move[1]+@c]
            if @square!=nil && @square==" "
                @moves.push(@square_coordinates)
            elsif @square!=nil && @square.color !=self.color
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates)
            end
        end
    end
    def bishop_scan
        ur_diag_scan
        ul_diag_scan
        dr_diag_scan
        dl_diag_scan
    end
    def queen_scan
        bishop_scan
        rook_scan
    end
    def king_scan()
        @king_moves=[[0,1],[1,1],[1,0],[-1,1],[1,-1],[0,-1],[-1,-1],[-1,0]]
        @king_moves.each do |move|
            @a=move[0]+@r
            @b=move[1]+@c
            next move if @a<0 || @a>7 || @b<0 || @b>7
            @square = @board_array[move[0]+@r][move[1]+@c]
            @square_coordinates = [move[0]+@r,move[1]+@c]
            if @square!=nil && @square==" "
                @moves.push(@square_coordinates)
            elsif @square!=nil && @square.color !=self.color
                @moves.push(@square_coordinates)
                @attacking.push(@square_coordinates)
            end
        end
    end


    attr_accessor :r,:c,:moves,:color,:moves
end
class BlackPawn < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♙"
        @r=r
        @c=c
        @board_array=board_array
        @position=[r,c]
        @move_count=0
        @moves=[]
        @attacking=[]
    end
    def get_moves
        @moves=[]
        @attacking=[]
        if @board_array[@r+1][@c]==" "
            @moves.push([@r+1,@c])
        end
        if @board_array[@r+2][@c]==" " && @board_array[@r+1][@c]==" " && @move_count==0
            @moves.push([@r+2,@c])
        end
        if @board_array[@r+1][@c+1] != " " && @board_array[@r+1][@c+1].color =="white"
            @moves.push([@r+1,@c+1])
            @attacking.push([@r+1,@c+1])
        end
        if @board_array[@r+1][@c-1] != " " && @board_array[@r+1][@c-1].color =="white"
            @moves.push([@r+1,@c-1])
            @attacking.push([@r+1,@c-1])
        end
    end

    attr_reader :symbol,:color,:moves,:attacking
end
class WhitePawn < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @symbol="♟︎"
        @r=r
        @c=c
        @position=[r,c]
        @moves=[]
        @attacking=[]
        @move_count=0
        @board_array=board_array
    end
    def get_moves()
        @moves=[]
        @attacking=[]
        if @board_array[@r-1][@c]==" "
            @moves.push([@r-1,@c])
        end
        if @board_array[@r-2][@c]==" " && @board_array[@r-1][@c]==" " && @move_count==0
            @moves.push([@r-2,@c])
        end

        if (@c-1) >0 && @board_array[@r-1][@c-1] != " " && @board_array[@r-1][@c-1].color =="black"
            @moves.push([@r-1,@c-1])
            @attacking.push([@r-1,@c-1])
        end

        if (@c+1) <7 && @board_array[@r-1][@c+1] != " " && @board_array[@r-1][@c+1].color =="black"
            @moves.push([@r-1,@c+1])
            @attacking.push([@r-1,@c+1])
        end
    end
    attr_reader :symbol,:color
end

class WhiteRook < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @symbol="♜"
        @board_array=board_array
        @r=r
        @c=c
        @position=[r,c]
        @type = "rook"
        @moves=[]
        @attacking=[]
    end
    attr_reader :symbol,:color
    def get_moves
        @moves=[]
        @attacking=[]
    self.rook_scan
    end

end
class WhiteKnight < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @symbol="♞"
        @board_array=board_array
        @r=r
        @c=c
        @position=[r,c]
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    attr_reader :symbol,:color,:r,:c,:board_array
    def get_moves
        @moves=[]
        @attacking=[]
    self.knight_scan
    end
end
class WhiteBishop < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @symbol="♝"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.bishop_scan
    end
    attr_reader :symbol,:color
end
class WhiteKing < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @type ="King"
        @symbol="♚"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @in_check=false
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.king_scan
    end
    attr_reader :symbol,:color
    attr_accessor :in_check
end
class WhiteQueen < Piece
    def initialize(r,c,board_array)
        @color ="white" 
        @symbol="♛"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.queen_scan
    end
    attr_reader :symbol,:color
end

class BlackRook < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♖"
        @r=r
        @c=c
        @board_array=board_array
        @position=[r,c]
        @moves=[]
        @attacking=[]
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.rook_scan
    end
    attr_reader :symbol,:color,:moves
end
class BlackKnight < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♘"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.knight_scan
    end
    attr_reader :symbol,:color
end
class BlackBishop < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♙"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.bishop_scan
    end
    attr_reader :symbol,:color
end
class BlackKing < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♔"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
        @in_check=false
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.king_scan
    end
    attr_reader :symbol,:color
    attr_accessor :in_check
end
class BlackQueen < Piece
    def initialize(r,c,board_array)
        @color ="black" 
        @symbol="♕"
        @r=r
        @c=c
        @position=[r,c]
        @board_array=board_array
        @moves=[]
        @attacking=[]
        @move_count=0
    end
    def get_moves
        @moves=[]
        @attacking=[]
        self.queen_scan
    end
    attr_reader :symbol,:color
end