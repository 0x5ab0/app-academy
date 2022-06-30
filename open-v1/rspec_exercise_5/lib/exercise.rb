def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select do |el|
        (prc_1.call(el) || prc_2.call(el)) && !(prc_1.call(el) && prc_2.call(el))
    end
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(arr, &prc)
    arr.inject do |max, el|
        if prc.call(el) >= prc.call(max)
            el
        else
            max
        end
    end
end

def my_group_by(arr, &prc)
    groups = Hash.new { |h, k| h[k] = [] }

    arr.each do |el|
        groups[prc.call(el)] << el
    end

    groups
end

def max_tie_breaker(arr, prc, &blk)
    arr.inject do |max, el|
        if blk.call(el) > blk.call(max)
            el
        elsif blk.call(el) < blk.call(max)
            max
        else
            if prc.call(el) > prc.call(max)
                el
            else
                max
            end
        end
    end
end

def silly_syllables(sentence)
    vowels = 'aeiou'.split('')
    words = sentence.split(' ')
    new_words = []

    words.each do |word|
        vowel_count = 0
        first_vowel_index = nil
        last_vowel_index = nil

        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                first_vowel_index = i if vowel_count == 0
                last_vowel_index = i
                vowel_count += 1
            end 
        end

        if vowel_count >= 2
            new_words << word[first_vowel_index..last_vowel_index]
        else
            new_words << word
        end
    end

    new_words.join(' ')
end