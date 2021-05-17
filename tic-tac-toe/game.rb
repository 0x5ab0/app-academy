require 'byebug'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
    # accepts an option hash where keys represent each player's mark
    # and its value shows if the player is human (true) or not (false)
    def initialize(board_size, options)
        @players = options.map do |mark, is_human|
            is_human ? HumanPlayer.new(mark) : ComputerPlayer.new(mark)
        end
        @current_player = @players[0]
        @board = Board.new(board_size)
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        @board.print

        while @board.empty_positions?
            legal_positions = @board.legal_positions
            pos = @current_player.get_position(legal_positions)
            
            @board.place_mark(pos, @current_player.mark)
            @board.print

            if @board.win?(@current_player.mark)
                puts "Player #{@current_player.mark} wins!"
                puts "Game's over. Create a new Game instance to play again."
                return
            else
                self.switch_turn
            end
        end

        puts "It's a draw!"
        puts "Game's over. Create a new Game instance to play again."
    end
end