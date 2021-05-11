class Board
    attr_reader :size
    
    def self.print_grid(grid)
        (0...grid.length).each do |row|
            puts grid[row].join(' ')
        end
    end

    def initialize(n)
        # 2D Array w/ n columns and n rows, all elements of which are :N
        @grid = Array.new(n) { Array.new(n) {:N} }
        @size = n * n
    end

    def [](position)
        row, column = *position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = *position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count { |cell| cell == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        total_ships = @size / 4

        while self.num_ships < total_ships do
            row = rand(@grid.length)
            column = rand(@grid.length)

            self[[row, column]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |cell|
                if cell == :S
                    :N
                else
                    cell
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
