class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{@mark}, enter two numbers representing a position in the format 'row col'"
        gets.chomp.split(' ').map(&:to_i)
    end 
end