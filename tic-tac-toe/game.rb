require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    def initialize(*marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play(board_size)
        board = Board.new(board_size)
        board.print

        while board.empty_positions?
            pos = @current_player.get_position
            board.place_mark(pos, @current_player.mark)
            board.print
            if board.win?(@current_player.mark)
                puts "Player #{@current_player.mark} wins!"
                return
            else
                self.switch_turn
            end
        end

        puts "It's a draw!"
    end
end