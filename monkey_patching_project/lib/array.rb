# Monkey-Patch Ruby's existing Array class to add your own custom methods

require 'byebug'

class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average 
        return nil if self.empty?
        self.sum / self.length.to_f 
    end

    def median
        return nil if self.empty?

        midpoint = (self.length / 2)

        if self.length.even?
            return ( self.sort[midpoint - 1] + self.sort[midpoint] ) / 2.0
        else
            return self.sort[midpoint]
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        count
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        self.each_with_index { |el, i| return i if el == val }
        nil
    end

    def my_uniq
        unique = []
        self.each do |el|
            unique << el if unique.my_count(el) == 0
        end
        unique
    end

    def my_transpose
        transposed = []

        self.each_with_index do |row, i|
            new_column = []
            
            self.each_with_index do |column, j|
                new_column << self[j][i]
            end

            transposed << new_column
        end

        transposed
    end
end