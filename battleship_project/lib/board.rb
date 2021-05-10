class Board
    attr_reader :size

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
        count = 0
        @grid.each { |row| count += row.count(:S) }
        count
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
        num_ships = @size / 4

        while num_ships > 0 do
            row = rand(@grid.length)
            column = rand(@grid.length)

            # if position already has ship, try again
            if self[[row, column]] == :S
                num_ships += 1
            # if not, add ship
            else
                self[[row, column]] = :S
            end

            num_ships -= 1
        end
    end

    def hidden_ships_grid
        @grid.map { |row| row.map do |cell|
            if cell == :S
                :N
            else
                cell
            end
        end }
    end

    def self.print_grid(grid)
        (0...grid.length).each do |row|
            puts grid[row].join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
