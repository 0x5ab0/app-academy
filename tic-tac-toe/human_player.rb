class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts "Player #{@mark}, enter two numbers representing a position in the format 'row col'"
        pos = nil
        while pos == nil
            pos = gets.chomp.split(' ').map(&:to_i)
            
            if !legal_positions.include?(pos)
                pos = nil
                puts 'Invalid choice. Choose an empty position!'
            end
        end
        pos
    end
end