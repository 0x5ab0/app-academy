require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/nullpiece.rb'

class Board
    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        make_starting_grid(fill_board)
    end

    def [](pos)
        raise "Invalid position" unless valid_pos?(pos)
        
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        raise "Invalid position" unless valid_pos?(pos)

        row, col = pos
        @rows[row][col] = piece
    end

    def add_piece(piece, pos)
        raise "Position not empty" unless empty?(pos)

        self[pos] = piece
    end

    def empty?(pos)
        self[pos].empty?
    end

    def move_piece(start_pos, end_pos)
        raise "Start position is empty" if empty?(start_pos)

        piece = self[start_pos]
        raise "This piece can't move like that" unless piece.moves.include?(end_pos)
        self[end_pos] = piece
        self[start_pos] = sentinel
        piece.pos = end_pos

        nil
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    private

    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8, sentinel) }
        return unless fill_board
        
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns_row(color)
        end
    end

    def fill_back_row(color)
        back_pieces = [
            Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]

        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(color, self, [i, j])
        end
    end

    def fill_pawns_row(color)
        i = color == :white ? 6 : 1
        8.times { |j| Pawn.new(color, self, [i, j]) }
    end
end

