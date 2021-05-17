class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? { |i| i >= 0 && i < @grid.length }
    end

    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(pos, mark)
        raise 'invalid position' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each { |row| puts row.join(' ') }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        d1 = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end

        d2 = (0...@grid.length).all? do |i|
            pos = [i, @grid.length - 1 - i]
            self[pos] == mark
        end

        d1 || d2
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? { |pos| self.empty?(pos) }
    end

    def legal_positions
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.select { |pos| self.empty?(pos) }
    end
end