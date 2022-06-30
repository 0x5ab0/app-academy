def range(min, max)
    return [] if min < max
    min + range(min + 1, max)
end

# Test Cases
# p range(0, 5) == [0, 1, 2, 3, 4, 5]
# p range(-2, 2) == [-2, -1, 0, 1, 2]
# p range(5, 0) == []

def exp_1(base, power)
    return nil if power < 0
    return 1 if power == 0

    base * exp_1(base, power - 1)
end

# Test Cases
# p exp_1(2, 3) == 8
# p exp_1(3, 3) == 27
# p exp_1(10, 4) == 10000
# p exp_1(-2, 3) == -8
# p exp_1(2, -3) == nil

def exp_2(base, power)
    return nil if power < 0
    return 1 if power == 0

    if power.even?
        exp_2(base, power / 2) ** 2
    else
        base * exp_2(base, (power - 1) / 2) ** 2
    end
end

# Test Cases
# p exp_2(2, 3) == 8
# p exp_2(3, 3) == 27
# p exp_2(10, 4) == 10000
# p exp_2(-2, 3) == -8
# p exp_2(2, -3) == nil

class Array
    def deep_dup
        new_array = []
        self.each do |el|
            new_array << (el.is_a?(Array) ? el.deep_dup : el)
        end
        new_array
    end
end

# Test Case
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_copy = robot_parts.deep_dup
# robot_parts_copy[1] << "LEDs"
# p robot_parts_copy[1] == ["capacitors", "resistors", "inductors", "LEDs"]
# p robot_parts[1] == ["capacitors", "resistors", "inductors"]

def fibonacci(n)
    return [] if n <= 0
    return [1] if n == 1
    return [1, 1] if n == 2

    first = fibonacci(n - 1)[-2]
    second = fibonacci(n - 1)[-1]

    fibonacci(n - 1) + [(first + second)]
end

# Test Cases
# p fibonacci(-1) == []
# p fibonacci(0) == []
# p fibonacci(1) == [1]
# p fibonacci(2) == [1, 1]
# p fibonacci(3) == [1, 1, 2]
# p fibonacci(4) == [1, 1, 2, 3]
# p fibonacci(5) == [1, 1, 2, 3, 5]
# p fibonacci(6) == [1, 1, 2, 3, 5, 8]
# p fibonacci(7) == [1, 1, 2, 3, 5, 8, 13]

def bsearch(array, target)
    return nil if array.empty?

    mid = array.length / 2
    
    case target <=> array[mid]
    when -1
        bsearch(array.take(mid), target)
    when 0
        mid
    when 1
        sub_answer = bsearch(array.drop(mid + 1), target)
        sub_answer.nil? ? nil : (mid + 1) + sub_answer
    end
end

# Test Cases
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
    def merge_sort
        return self if length <= 1

        mid = length / 2
        left, right = self.take(mid), self.drop(mid)
        sorted_left, sorted_right = left.merge_sort, right.merge_sort

        merge(sorted_left, sorted_right)
    end

    def merge(left, right)
        merged_array = []
        until left.empty? || right.empty?
            val = (left.first < right.first) ? left.shift : right.shift
            merged_array << val
        end
        merged_array + left + right
    end
end

# Test case
# p [6, 5, 3, 1, 8, 7, 2, 4].merge_sort == [1, 2, 3, 4, 5, 6, 7, 8]
# p [3, 2, 1, 4].merge_sort == [1, 2, 3, 4]

class Array
    def subsets
        return [[]] if empty?
        subs = take(length - 1).subsets
        subs.concat(subs.map { |sub| sub + [last] })
    end
end

# Test Cases
# p [].subsets == [[]]
# p [1].subsets == [[], [1]]
# p [1, 2].subsets == [[], [1], [2], [1, 2]]
# p [1, 2, 3].subsets == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
    return [array] if array.length <= 1

    first = array.shift
    perms = permutations(array)
    total_permutations = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_permutations << perm[0...i] + [first] + perm[i..-1]
        end
    end

    total_permutations
end

# Test Cases
# p permutations([1, 2, 3]).sort == [1, 2, 3].permutation.to_a.sort
# p permutations([8, 8, 10, 10]).sort == [8, 8, 10, 10].permutation.to_a.sort
# p permutations([-4, -3]).sort == [-4, -3].permutation.to_a.sort
# p permutations([]).sort == [].permutation.to_a.sort

def greedy_make_change(amount, coins = [25, 10, 5, 1])
    change = coins.sort.reverse.map do |coin|
        number_of_coins = amount/coin
        amount %= coin # updates amount for the next coin iteration
        # (e.g. if amount = 123 and coin = 25... amount = 123 % 25 => amount = 23 )
        Array.new(number_of_coins) { coin }
    end
    change.flatten
end

# Test Cases
# p greedy_make_change(123) == [25, 25, 25, 25, 10, 10, 1, 1, 1]
# p greedy_make_change(24, [10, 7, 1]) == [10, 10, 1, 1, 1, 1]

def make_better_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0
    return nil if coins.none? { |coin| coin <= amount }

    coins = coins.sort.reverse
    best_change = nil

    coins.each_with_index do |coin, i|
        next if coin > amount

        remainder = amount - coin
        best_remainder = make_better_change(remainder, coins.drop(i)) # coins.drop(i) to avoid double-counting

        next if best_remainder.nil?
        this_change = [coin] + best_remainder

        if best_change.nil? || (this_change.count < best_change.count)
            best_change = this_change
        end
    end

    best_change
end

# Test Cases
# p make_better_change(123) == [25, 25, 25, 25, 10, 10, 1, 1, 1]
# p make_better_change(24, [10, 7, 1]) == [10, 7, 7]