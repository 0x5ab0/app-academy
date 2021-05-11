# Exercise problems: https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/recap-exercise-3

require 'byebug'

# PART A: Strings

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    count.keys.select { |el| count[el] <= 1 }
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end

    true
end

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index do |char, i|
        indices[char] += [i]
    end

    indices
end

def longest_streak(str)
    current = ''
    longest = ''

    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            current += str[i]
        else
            current = str[i]
        end

        longest = current if current.length >= longest.length
    end

    longest
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |n| num % n == 0 }
end

def prime_factors(num)
    (2...num).select do |factor|
        num % factor == 0 && prime?(factor)
    end
end

def bi_prime?(num)
    primes = prime_factors(num)
    primes.any? do |a|
        b = num / a
        primes.include?(b)
    end
end

def vigenere_cipher(message, keys)
    alpha = ('a'..'z').to_a
    cipher = ''
    
    message.each_char.with_index do |char, i|
        offset = keys[i % keys.length]
        
        old_i = alpha.index(char)
        new_i = (old_i + offset) % alpha.length
        
        cipher += alpha[new_i]
    end

    cipher
end

def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = 'aeiou'.split('')
    vowel_indices = (0...str.length).select { |i| vowels.include?(str[i]) }
    new_vowel_indices = vowel_indices.rotate(-1)

    vowel_indices.each_with_index do |vowel_index, i|
        new_vowel = str[new_vowel_indices[i]]
        
        new_str[vowel_index] = new_vowel
    end

    new_str
end

# Test calls (Part A)

p no_dupes?([1, 1, 2, 1, 3, 2, 4]) == [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z']) == ['y']
p no_dupes?([true, true, true]) == []
p ' '
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']) == true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse']) == false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3]) == true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3]) == false
p no_consecutive_repeats?(['x']) == true
p ' '
p char_indices('mississippi') == {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom') == {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
p ' '
p longest_streak('a') == 'a'
p longest_streak('accccbbb') == 'cccc'
p longest_streak('aaaxyyyyyzz') == 'yyyyy'
p longest_streak('aaabbb') == 'bbb'
p longest_streak('abc') == 'c'
p ' '
p bi_prime?(14) == true
p bi_prime?(22) == true
p bi_prime?(25) == true
p bi_prime?(94) == true
p bi_prime?(24) == false
p bi_prime?(64) == false
p ' '
p vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3]) == "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0]) == "ceerd"
p vigenere_cipher("yawn", [5, 1]) == "dbbo"
p ' '
p vowel_rotate('computer') == "cempotur"
p vowel_rotate('oranges') == "erongas"
p vowel_rotate('headphones') == "heedphanos"
p vowel_rotate('bootcamp') == "baotcomp"
p vowel_rotate('awesome') == "ewasemo"