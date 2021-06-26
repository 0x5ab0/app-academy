# BIGGEST FISH SEARCH

# Quadratic, O(n^2)
def quadratic_biggest_fish(fishes)
    fishes.each_with_index do |fish1, i|
        max_length = true

        fishes.each_with_index do |fish2, j|
            next if i == j
            max_length = false if fish2.length > fish1.length
        end

        return fish1 if max_length
    end
end

# Linearithmic, O(n log n)
class Array

    def merge_sort(&prc)
        prc ||= Proc.new { |x, y| x <=> y }

        return self if count <= 1

        midpoint = count / 2
        sorted_left = self.take(midpoint).merge_sort(&prc)
        sorted_right = self.drop(midpoint).merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    private
    def self.merge(left, right, &prc)
        merged = []
    
        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
                merged << left.shift
            when 0
                merged << left.shift
            when 1
                merged << right.shift
            end
        end
    
        merged.concat(left)
        merged.concat(right)
    
        merged
    end
end

def nlogn_biggest_fish(fishes)
    prc = Proc.new { |x, y| y.length <=> x.length }
    fishes.merge_sort(&prc)[0]
end

# Linear, O(n)
def linear_biggest_octopus(fishes)
    biggest_fish = fishes.first

    fishes.each do |fish|
        if fish.length > biggest_fish.length
            biggest_fish = fish
        end
    end

    biggest_fish
end

# OCTOPUS DANCING

# Linear, O(n)

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, index|
        return index if tile == direction
    end
end

# Constant, O(1)

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end