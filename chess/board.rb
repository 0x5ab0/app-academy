require 'byebug'
require_relative 'piece'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) { nil } }

        for row in (0..7)
            next if row.between?(2, 5)
            for col in (0..7)
                pos = [row, col]
                self[pos] = Piece.new(pos)
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    # def print
    #     for row in @rows
    #         for col in row
    #             if col.nil?
    #                 p nil
    #             else
    #                 p col.pos
    #             end
    #         end
    #     end
    # end

    def move_piece(start_pos, end_pos)
        raise "There's no piece there to move" if self[start_pos].nil? 
        raise "Cannot move the piece to that position" unless self[end_pos].nil?

        # Store Piece instance
        piece = self[start_pos]
        # Update grid (piece leaves start_pos)
        self[start_pos] = nil
        # Update Piece's position
        piece.pos = end_pos
        # Update grid (piece goes to end_pos)
        self[end_pos] = piece
    end
end
