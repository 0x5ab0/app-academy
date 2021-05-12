def proper_factors(num)
    (1...num).to_a.select do |factor|
        num % factor == 0
    end
end

def aliquot_sum(num)
    factors = proper_factors(num)
    factors.sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    count = 0
    arr = []

    i = 0
    while count < n
        i += 1
        if perfect_number?(i)
            arr << i
            count += 1
        end
    end

    arr
end