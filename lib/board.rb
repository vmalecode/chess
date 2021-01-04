require 'colorize'
class ChessBoard
    def initialize
        @board_array = Array.new(8," ") {Array.new(8," ")}

    end
    attr_accessor :board_array
    def print_board
        puts "   0  1  2  3  4  5  6  7  "
        @s=1
        @r_num=0
        @square=""
        @board_array.each_with_index do |sub, i|
            print "#{@r_num} "
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
            puts 
            @r_num+=1   
            @s+=1
        end

    
    end
    def set_pieces #sets all squares to starting position
        @board_array[6].each_with_index do |sub,i|
            @board_array[6][i]=WhitePawn.new(6,i)
        end

        @board_array[1].each_with_index do |space,i|
            @board_array[1][i]=BlackPawn.new(1,i)
        end


        @board_array[7][0]=WhiteRook.new(7,0)
        @board_array[7][7]=WhiteRook.new(7,7)
        @board_array[7][1]=WhiteKnight.new(7,1)
        @board_array[7][6]=WhiteKnight.new(7,6)
        @board_array[7][2]=WhiteBishop.new(7,2)
        @board_array[7][5]=WhiteBishop.new(7,5)
        @board_array[7][3]=WhiteQueen.new(7,3)
        @board_array[7][4]=WhiteKing.new(7,4)

        @board_array[0][0]=BlackRook.new(0,0)
        @board_array[0][7]=BlackRook.new(0,7)
        @board_array[0][1]=BlackKnight.new(0,1)
        @board_array[0][6]=BlackKnight.new(0,6)
        @board_array[0][2]=BlackBishop.new(0,2)
        @board_array[0][5]=BlackBishop.new(0,5)
        @board_array[0][3]=BlackQueen.new(0,3)
        @board_array[0][4]=BlackKing.new(0,4)



        @board_array[2..5].each_with_index do |sub,i| #erases the empty squares in mid
            sub.each_with_index do |square,j|
                @board_array[i+2][j]=" "
            end
        end
            #adding testing conditions here------
            @board_array[2][1]=WhiteRook.new(2,1)
            #end test conditions --------
         
    end
    def move_piece(r1,c1,r2,c2)
        @board_array[r2][c2]=@board_array[r1][c1]
        @board_array[r2][c2].change_position(r2,c2)
        @board_array[r1][c1]=" "
    end

end
