require 'colorize'
class ChessBoard
    def initialize
        @spaces = Array.new(64,"   ")
        @spaces[5]=" ♙ "
        @spaces[6]=" ♙ "
    end
    attr_reader :spaces
    def print_board
        @s=1
        @spaces.each_with_index do |space, i|
            
            if (i+1)%8==0
                if (@s)%2==0
                    puts "#{space}".colorize(:background => :light_black)
                    @s+=1
                else
                    puts "#{space}".colorize(:background => :black)
                    @s+=1
                end
            
            else
                if (@s)%2==0
                    print "#{space}".colorize(:background => :light_black)
                else
                    print "#{space}".colorize(:background => :black)
                end
            end
            @s+=1
        end

    
    end

end
