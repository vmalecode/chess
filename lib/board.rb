require 'colorize'
class ChessBoard
    def initialize
        @spaces = Array.new(64," ")

    end
    attr_reader :spaces
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
    def set_pieces
#        @spaces[8..15].each_with_index do |space,i|
#           space=WhitePawn.new
#        end
        @spaces[8]=WhitePawn.new()
    end
end
