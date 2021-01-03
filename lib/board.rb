require 'colorize'
class ChessBoard
    def initialize
        @spaces = Array.new(64," ")

    end
    attr_accessor :spaces
    def print_board
        @s=1
        @piece=""
        @spaces.each_with_index do |space, i|
            if space !=" "
                @piece=space.symbol
            else
                @piece = " "
            end
            if (@s)%2==0
                print " #{@piece} ".colorize(:background => :light_black)
                @s+=1
            else
                print " #{@piece} ".colorize(:background => :black)
                @s+=1
            end
            if (i+1)%8==0 &&i!=0
                @s+=1
                puts""
            end
            
        end

    
    end
    def set_pieces #sets all pieces to starting position
        @spaces[48..55].each_with_index do |space,i|
            @spaces[i+48]=WhitePawn.new
        end
        @spaces[7..14].each_with_index do |space,i|
            @spaces[i+8]=BlackPawn.new
            end
        @spaces[56]=WhiteRook.new
        @spaces[63]=WhiteRook.new
        @spaces[57]=WhiteKnight.new
        @spaces[62]=WhiteKnight.new
        @spaces[58]=WhiteBishop.new
        @spaces[61]=WhiteBishop.new
        @spaces[59]=WhiteQueen.new
        @spaces[60]=WhiteKing.new

        @spaces[0]=BlackRook.new
        @spaces[7]=BlackRook.new
        @spaces[1]=BlackKnight.new
        @spaces[6]=BlackKnight.new
        @spaces[2]=BlackBishop.new
        @spaces[5]=BlackBishop.new
        @spaces[3]=BlackQueen.new
        @spaces[4]=BlackKing.new

        @spaces[23..46].each_with_index do |space,i|
            @spaces[i+24]=" "
            end
    
         
    end
end
