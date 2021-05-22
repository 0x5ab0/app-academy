require_relative 'tile'

class Board
    def self.from_file
        # read a file and parse it into a 2D Array containing Tile instances
    end
    
    def initialize(grid)
        @grid = grid
    end

    def update_value(pos)
        # update value of a Tile at the given position
    end

    def render
        # display the current board state
    end

    def solved?
        # determine whether the game is over
        # use helper methods to know if each row, column, and 3x3 square has been solved
    end
end