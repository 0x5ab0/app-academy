def proper_factors(num)
    (1...num).to_a.select do |factor|
        num % factor == 0
    end
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []

    i = 0
    while arr.length < n
        i += 1
        arr << i if perfect_number?(i)
    end

    arr
end