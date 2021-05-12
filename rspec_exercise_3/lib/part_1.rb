def is_prime?(num)
    return false if num < 2

    (2...num).any? do |factor|
        return false if num % factor == 0
    end
    
    true
end

def nth_prime(n)
    primes_count = 0

    i = 0
    while true
        if is_prime?(i)
            primes_count += 1
            if primes_count == n
                return i
            end
        end
        i += 1
    end
end

def prime_range(min, max)
    primes = []

    (min..max).each do |n|
        primes << n if is_prime?(n)
    end

    primes
end