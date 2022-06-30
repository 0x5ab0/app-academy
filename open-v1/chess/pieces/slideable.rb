module Slideable
    HORIZONTAL_AND_VERTICAL = [
        [-1, 0],
        [ 0,-1],
        [ 1, 0],
        [ 0, 1]
    ].freeze

    DIAGONAL = [
        [-1,-1],
        [-1, 1],
        [ 1,-1],
        [-1, 1]
    ].freeze

    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL
    end

    def diagonal_dirs
        DIAGONAL
    end

    def moves
        moves = []

        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end

        moves
    end

    private

    def move_dirs
        # subclass implements this
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        x, y = pos
        moves = []

        loop do
            x, y = x + dx, y + dy
            pos = [x, y]

            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                # can't take an opponent's piece
                moves << pos if board[pos].color != color
                # can't move past blocking piece
                break
            end
        end
        
        moves
    end
end
