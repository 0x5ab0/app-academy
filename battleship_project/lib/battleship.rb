require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts (@board.size / 4).to_s
        @board.print
    end

    def lose?
        if @remaining_misses > 0
            false
        else
            puts 'you lose'
            true
        end
    end

    def win?
        if @board.num_ships > 0
            false
        else
            puts 'you win'
            true
        end
    end

    def game_over?
        self.lose? || self.win?
    end

    def turn
        position = @player.get_move
        if !@board.attack(position)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end
end
