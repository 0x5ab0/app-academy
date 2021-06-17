require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      # The board is over and the winner is not the player.
      return @board.won? && @board.winner != evaluator
    end

    if @next_mover_mark == evaluator
      # Player's turn + all children nodes are losers for the player
      # (anywhere they move they still lose).
      children.all? { |node| node.losing_node?(evaluator) }
    else
      # Opponent's turn + one of the children nodes is a losing node for the player
      # (assumes opponent plays perfectly and will force a loss if they can).
      children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      # The board is over and the winner is the player.
      return @board.won? && @board.winner == evaluator
    end

    if @next_mover_mark == evaluator
      # Player's turn + one of the children nodes is a winning node for the player.
      children.any? { |node| node.winning_node?(evaluator) }
    else
      # Opponent's turn + all children nodes are winners for the player.
      children.all? { |node| node.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    (0..2).each do |i|
      (0..2).each do |j|
        pos = [i, j]

        next unless @board.empty?(pos)

        new_board = @board.dup
        new_board[pos] = @next_mover_mark
        @next_mover_mark = (@next_mover_mark == :x ? :o : :x)

        children << TicTacToeNode.new(new_board, next_mover_mark, pos)
      end
    end

    children
  end
end

