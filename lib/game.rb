class Game
    def initialize
        @myboard = ChessBoard.new
        @myboard.set_pieces
        @choice
        @i=0
        @team_attack=[]
        @white_king=[]
        @black_king=[]
    end



    def play
    while @i < 20
        white_turn

        black_turn

    end

    end

    def player_select_piece(color)

        loop do
            print "#{color} choose a piece: "
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
    def player_select_move
        loop do
            print "Select a move: "
            @selected_move = gets.strip
            #@choice = "72"
            break if @selected_move.length==2 && /[0-7]/.match(@selected_move[0]) && /[0-7]/.match(@selected_move[1]) && @choice.moves.include?([@selected_move[0].to_i,@selected_move[1].to_i])
            puts "Invalid choice"
        end
    
    
    end
    def white_turn
        @myboard.print_board
        player_select_piece("white")
        @myboard.print_board(@choice.moves)
        player_select_move
        @myboard.move_piece(@choice.r,@choice.c,@selected_move[0].to_i,@selected_move[1].to_i)
        @myboard.print_board
    end
    def black_turn
        player_select_piece("black")
        @myboard.print_board(@choice.moves)
        player_select_move
        @myboard.move_piece(@choice.r,@choice.c,@selected_move[0].to_i,@selected_move[1].to_i)
        @myboard.print_board
        @i+=1
    end

attr_accessor :myboard

end