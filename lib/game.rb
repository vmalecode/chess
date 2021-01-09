class Game
    def initialize
        @myboard = ChessBoard.new
        @myboard.set_pieces
        @myboard.print_board
        @choice
    end



    def play
        player_select_piece("white")
        @myboard.print_board(@choice.moves)

    end

    def player_select_piece(color)

        loop do
            print "white choose a piece: "
            @choice = gets.strip
            #@choice = "72"
            break if @choice.length==2 && /[0-7]/.match(@choice[0]) && /[0-7]/.match(@choice[1]) &&@myboard.board_array[@choice[0].to_i][@choice[1].to_i] != " " &&@myboard.board_array[@choice[0].to_i][@choice[1].to_i].color==color
            puts "Invalid choice"
        end
        @a=[@choice[0].to_i,@choice[1].to_i]
        @choice=@myboard.board_array[@choice[0].to_i][@choice[1].to_i]
        @choice.get_moves
        if @choice.moves.length==0
        puts "This piece has no valid moves"
        player_select_piece(color)
        end
    end
    #@choice = "64"





end