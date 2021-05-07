# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'byebug'

def divisors(num)
    arr = (1..num).select do |i|
        num % i == 0
    end
end

def is_prime?(num)
    return false if num < 2
    divisors(num) == [1, num]
end

def largest_prime_factor(num)
    divs = divisors(num)
    divs.select! { |div| is_prime?(div) }
    divs.sort
    divs[-1]
end

def unique_chars?(str)
    chars = Hash.new(0)
    str.each_char { |char| chars[char] += 1 }
    chars.each do |char, count|
        return false if count > 1
    end
    true
end

def el_count(arr)
    el_count = Hash.new(0)
    
    arr.each_with_index do |el, i|
        el_count[el] += 1
    end

    el_count
end

def dupe_indices(arr)
    hash = Hash.new([])

    arr.each_with_index do |el, i|
        hash[el] += [i] if el_count(arr)[el] > 1
    end

    hash
end

def ana_array(arr_1, arr_2)
    arr_1_counter = el_count(arr_1)
    arr_2_counter = el_count(arr_2)

    arr_1_counter.each do |k1, v1|
        arr_2_counter.each do |k2, v2|
            if arr_1_counter[k1] == arr_2_counter[k2]
                arr_1_counter.delete(k1)
                arr_2_counter.delete(k2)
            end
        end
    end

    arr_1_counter == arr_2_counter
end