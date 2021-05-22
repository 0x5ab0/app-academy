require 'colorize'

class Tile
    def initialize(value, given = false)
        @value = value
        @given = given
    end

    def to_s
        # show @value as a string
        # distinguish between given and non-given tiles with the 'colorize' gem 
    end
end