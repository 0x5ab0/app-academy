def is_prime?(num)
    (2...num).any? do |factor|
        return false if num % factor == 0
    end
    
    num > 1
end

def nth_prime(n)
    primes_count = 0

    i = 0
    while primes_count < n
        i += 1
        primes_count += 1 if is_prime?(i)
    end

    i
end

def prime_range(min, max)
    primes = []

    (min..max).each do |n|
        primes << n if is_prime?(n)
    end

    primes
end