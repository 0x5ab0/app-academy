require_relative 'tile'

class Board
    def self.empty_grid
        # 9x9 2D Array containing Tile instances
        Array.new(9) { Array.new(9) { Tile.new(0) } }
    end

    def self.from_file(filename)
        # read a file and parse it into a new Board
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split('').map { |char| Integer(char) }
            nums.map { |num| Tile.new(num) }
        end

        self.new(tiles)
    end
    
    def initialize(grid = Board.empty_grid)
        @grid = grid
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        # update value of a Tile at the given position
        row, col = pos
        tile = @grid[row][col]
        tile.value = value
    end

    def render
        # display the current board state
        puts "  #{(0..8).to_a.join(' ')}"
        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def solved?
        # determine whether the game is over
        rows.all? { |row| solved_set?(row) } &&
            columns.all? { |column| solved_set?(column) } &&
            squares.all? { |square| solved_set?(square) }
    end

    # Helper methods for Board#solved?

    def solved_set?(tiles)
        nums = tiles.map(&:value)
        nums.sort == (1..9).to_a
    end

    def size
        @grid.size
    end

    def rows
        @grid
    end

    def columns
        rows.transpose
    end

    def squares
        (0..8).to_a.map { |i| square(i) }
    end

    def square(idx)
        tiles = []
        x = (idx / 3) * 3
        y = (idx % 3) * 3

        (x...x + 3).each do |i|
            (y...y + 3).each do |j|
                tiles << self[[i,j]]
            end
        end

        tiles
    end

    def dup
        duped_grid = @grid.map do |row|
            row.map { |tile| Tile.new(tile.value) }
        end

        Board.new(duped_grid)
    end

    private

    attr_reader :grid
end