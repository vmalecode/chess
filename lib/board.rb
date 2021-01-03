require 'colorize'
class ChessBoard
    def initialize
        @board_array = Array.new(64," ")

    end
    attr_accessor :board_array
    def print_board
        @s=1
        @piece=""
        @board_array.each_with_index do |space, i|
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
        @board_array[48..55].each_with_index do |space,i|
            @board_array[i+48]=WhitePawn.new(i+48)
        end
        @board_array[7..14].each_with_index do |space,i|
            @board_array[i+8]=BlackPawn.new(i+8)
            end
        @board_array[56]=WhiteRook.new(56)
        @board_array[63]=WhiteRook.new(63)
        @board_array[57]=WhiteKnight.new(57)
        @board_array[62]=WhiteKnight.new(62)
        @board_array[58]=WhiteBishop.new(58)
        @board_array[61]=WhiteBishop.new(61)
        @board_array[59]=WhiteQueen.new(59)
        @board_array[60]=WhiteKing.new(60)

        @board_array[0]=BlackRook.new(0)
        @board_array[7]=BlackRook.new(7)
        @board_array[1]=BlackKnight.new(1)
        @board_array[6]=BlackKnight.new(6)
        @board_array[2]=BlackBishop.new(2)
        @board_array[5]=BlackBishop.new(5)
        @board_array[3]=BlackQueen.new(3)
        @board_array[4]=BlackKing.new(4)

        @board_array[23..46].each_with_index do |space,i|
            @board_array[i+24]=" "
            end
    
         
    end
end
