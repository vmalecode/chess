@board_array[0][0]=BlackRook.new(1)
@board_array[0][7]=BlackRook.new(63)
@board_array[0][1]=BlackKnight.new(57)
@board_array[0][6]=BlackKnight.new(62)
@board_array[0][2]=BlackBishop.new(58)
@board_array[0][5]=BlackBishop.new(61)
@board_array[0][3]=BlackQueen.new(59)
@board_array[0][4]=BlackKing.new(60)
board_array[@r][@c+@i]

def get_moves(board_array)
    if self.type =="rook"
        @i=1
        loop do 
            #down
            if board_array[@r+@i][@c]==" " 
                @moves.push([@r+@i,@c])
            end
            if board_array[@r+@i][@c].color != self.color
                @moves.push([@r+@i,@c])
                @attacking.push([@r+@i,@c])
            end
            if board_array[@r+@i][@c] != " "
                @continue_down = 0
            end
            # up
            if board_array[@r-@i][@c]==" "
                @moves.push([@r-@i,@c])
            end
            if board_array[@r-@i][@c].color != self.color
                @moves.push([@r-@i,@c])
                @attacking.push([@r-@i,@c])  
            end
            if board_array[@r-@i][@c] != " "
                @continue_up= 0
            end
            #right
            if board_array[@r][@c+@i]==" "
                @moves.push([@r,@c+@i])
            end
            if board_array[@r][@c+@i].color != self.color
                @moves.push([@r,@c+@i])
                @attacking.push([@r,@c+@i]) 
            end
            if board_array[@r][@c+@i]!=" "
                @continue_right=0
            end    def get_moves(board_array)
    if self.type =="rook"
        @i=1
        loop do 
            #down
            if board_array[@r+@i][@c]==" " 
                @moves.push([@r+@i,@c])
            end
            if board_array[@r+@i][@c].color != self.color
                @moves.push([@r+@i,@c])
                @attacking.push([@r+@i,@c])
            end
            if board_array[@r+@i][@c] != " "
                @continue_down = 0
            end
            # up
            if board_array[@r-@i][@c]==" "
                @moves.push([@r-@i,@c])
            end
            if board_array[@r-@i][@c].color != self.color
                @moves.push([@r-@i,@c])
                @attacking.push([@r-@i,@c])  
            end
            if board_array[@r-@i][@c] != " "
                @continue_up= 0
            end
            #right
            if board_array[@r][@c+@i]==" "
                @moves.push([@r,@c+@i])
            end
            if board_array[@r][@c+@i].color != self.color
                @moves.push([@r,@c+@i])
                @attacking.push([@r,@c+@i]) 
            end
            if board_array[@r][@c+@i]!=" "
                @continue_right=0
            end
            #left
            if board_array[@r][@c-@i]==" "
                @moves.push([@r,@c-@i])
            end
            if board_array[@r][@c-@i].color != self.color
                @moves.push([@r,@c-@i])
                @attacking.push([@r,@c-@i]) 
            end
            if board_array[@r][@c-@i]!=" "
                @continue_left=0
            end

            break if @continue_down+@continue_up+@continue_right+@continue_left==0
            break if @i>9
            @i+=1
        end




    elsif

    end
end

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