require 'byebug'
class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        return if @parent == parent
        @parent.children.delete(self) unless @parent.nil?
        @parent = parent
        @parent.children << self unless @parent.nil?
        self
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child && !@children.include?(child)
            raise "Tried to remove node that isn't a child"
        end
        child.parent = nil
    end
    
    def dfs(target)
        return self if @value == target

        @children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end

        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            el = queue.shift
            return el if el.value == target
            el.children.each do |child|
                queue << child
            end
        end
    end
end
