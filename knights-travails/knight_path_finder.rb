require_relative '../polytreenode/lib/00_tree_node.rb'

class KnightPathFinder
    DELTAS = [
        [-1, -2],
        [-2, -1],
        [ 1,  2],
        [ 2,  1],
        [-1,  2],
        [-2,  1],
        [ 1, -2],
        [ 2, -1],
    ]

    def self.valid_moves(pos)
        x, y = pos

        DELTAS.map do |(dx, dy)|
            new_pos = [x + dx, y + dy]
            unless KnightPathFinder.out_of_bounds(new_pos)
                new_pos
            end
        end
    end

    def self.out_of_bounds(pos)
        x, y = pos
        x < 0 || x > 7 || y < 0 || y > 7        
    end

    attr_reader :start_pos

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
        
        build_move_tree
    end

    private

    attr_accessor :root_node, :considered_positions

    def new_move_positions
        KnightPathFinder.valid_moves(@start_pos)
            .reject { |pos| @considered_positions.include?(pos) }
            .each { |pos| @considered_positions << pos }
        end
    end

    def build_move_tree
        @root_node = PolyTreeNode.new(@start_pos)

        nodes = [@root_node]
        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value

            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def find_path(goal)

    end
end

kpf = KnightPathFinder.new([0, 0])