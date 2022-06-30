require_relative 'item.rb'

class List
    LINE_WIDTH = 49
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10
    DONE_COL_WIDTH = 5

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        0 <= index && index < self.size
    end

    def swap(i, j)
        return false if !self.valid_index?(i) || !self.valid_index?(j)
        @items[i], @items[j] = @items[j], @items[i]
        true
    end

    def priority
        self[0]
    end

    def print
        puts '-' * LINE_WIDTH
        puts self.label.to_s.upcase.center(LINE_WIDTH)
        puts '-' * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | #{'Done?'.ljust(DONE_COL_WIDTH)}"
        puts '-' * LINE_WIDTH

        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{(item.done ? '[✓]' : '[ ]').ljust(DONE_COL_WIDTH)}"
        end
        puts '-' * LINE_WIDTH
    end

    def print_full_item(index)
        item = self[index]
        return if item.nil?
        puts '-' * LINE_WIDTH
        puts "#{item.title.ljust(LINE_WIDTH - DEADLINE_COL_WIDTH - DONE_COL_WIDTH)}#{item.deadline.rjust(DEADLINE_COL_WIDTH)}#{(item.done ? '[✓]' : '[ ]').rjust(DONE_COL_WIDTH)}"
        puts item.description
        puts '-' * LINE_WIDTH
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != size - 1
            swap(index, index + 1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        self[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.reject! { |item| item.done }
    end
end