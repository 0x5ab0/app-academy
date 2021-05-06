def partition(arr, num)
    partition_1 = []
    partition_2 = []
    
    arr.each do |el|
        if el < num
            partition_1 << el
        else
            partition_2 << el
        end
    end

    [partition_1, partition_2]
end

def merge(hash_1, hash_2)
    hashes = [hash_1, hash_2]
    merged = {}

    hashes.each do |hash|
        hash.each { |key, val| merged[key] = val }
    end

    merged
end

def censor(sentence, cursed_words)
    words = sentence.split(' ')
    vowels = 'aeiou'

    words.map! do |word|
        if cursed_words.include?(word.downcase)
            word.each_char.with_index do |char, i|
                word[i] = '*' if vowels.include?(char.downcase)
            end
        else
            word
        end
    end

    words.join(' ')
end

def power_of_two?(num)
    # 2 ** i = num  ==  i * log(2) = log(num)
    i = (Math.log(num)/Math.log(2)).truncate

    if 2 ** i == num
        return true
    else
        return false
    end
end