require 'colorize'
class ChessBoard
    def initialize
        @board_array = Array.new(8," ") {Array.new(8," ")}

    end
    attr_accessor :board_array
    def print_board
        @s=1
        @square=""
        @board_array.each_with_index do |sub, i|
            sub.each_with_index do |row_element,j|
                if row_element !=" "
                    @square=row_element.symbol
                else
                    @square = " "
                end
                if @s.even?
                    print " #{@square} ".colorize(:background => :light_black)
                    @s+=1
                else
                    print " #{@square} ".colorize(:background => :black)
                    @s+=1
                end
            end
            puts""    
            @s+=1
        end

    
    end
    def set_pieces #sets all squares to starting position
        @board_array[6].each_with_index do |sub,i|
            @board_array[6][i]=WhitePawn.new(1)
        end

        @board_array[1].each_with_index do |space,i|
            @board_array[1][i]=BlackPawn.new(1)
        end

        @board_array[7][0]=WhiteRook.new(1)
        @board_array[7][7]=WhiteRook.new(63)
        @board_array[7][1]=WhiteKnight.new(57)
        @board_array[7][6]=WhiteKnight.new(62)
        @board_array[7][2]=WhiteBishop.new(58)
        @board_array[7][5]=WhiteBishop.new(61)
        @board_array[7][3]=WhiteQueen.new(59)
        @board_array[7][4]=WhiteKing.new(60)

        @board_array[0][0]=BlackRook.new(1)
        @board_array[0][7]=BlackRook.new(63)
        @board_array[0][1]=BlackKnight.new(57)
        @board_array[0][6]=BlackKnight.new(62)
        @board_array[0][2]=BlackBishop.new(58)
        @board_array[0][5]=BlackBishop.new(61)
        @board_array[0][3]=BlackQueen.new(59)
        @board_array[0][4]=BlackKing.new(60)



        @board_array[2..5].each_with_index do |sub,i| #erases the empty squares in mid
            sub.each_with_index do |square,j|
                @board_array[i+2][j]=" "
            end
        end
    
         
    end
end
