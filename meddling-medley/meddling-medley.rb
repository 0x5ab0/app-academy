require 'byebug'

def duos(str)
    duos_count = 0
    (0...str.length - 1).each do |i|
        duos_count += 1 if str[i] == str[i + 1] 
    end
    duos_count
end

# p duos('bootcamp') == 1
# p duos('wxxyzz') == 2
# p duos('hoooraay') == 3
# p duos('dinosaurs') == 0
# p duos('e') == 0

def sentence_swap(sentence, cipher)
    words = sentence.split(' ')
    new_words = []
    words.each do |word|
        if cipher.has_key?(word)
            new_words << cipher[word]
        else
            new_words << word
        end
    end
    new_words.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) == 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) == 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) == 'keep running okay'

def hash_mapped(hash, prc, &blk)
    mapped = {}
    hash.each do |key, value|
        mapped[blk.call(key)] = prc.call(value)
    end
    mapped
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' } == {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n } == {25=>"q", 36=>"w"}

def counted_characters(str)
    char_count = Hash.new(0)
    str.each_char { |char| char_count[char] += 1 } 
    char_count
        .select { |char, count| count > 2 }
        .keys
end

# p counted_characters("that's alright folks") == ["t"]
# p counted_characters("mississippi") == ["i", "s"]
# p counted_characters("hot potato soup please") == ["o", "t", " ", "p"]
# p counted_characters("runtime") == []

def triplet_true(str)
    (0...str.length - 2).any? do |i|
        str[i..i + 2] == str[i] * 3
    end
end

# p triplet_true('caaabb') == true
# p triplet_true('terrrrrible') == true
# p triplet_true('runninggg') == true
# p triplet_true('bootcamp') == false
# p triplet_true('e') == false

def energetic_encoding(str, cipher)
    new_str = ''
    str.each_char do |char|
        if cipher.has_key?(char)
            new_str += cipher[char]
        elsif char == ' '
            new_str += ' '
        else
            new_str += '?'
        end
    end
    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) == 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) == 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) == '?arri ?i?r?'

# p energetic_encoding('bike', {}) == '????'

def uncompress(str)
    uncompressed = ''
    i = 0
    while i < str.length
        reps = str[i + 1].to_i
        uncompressed += (str[i] * reps)

        i += 2
    end
    uncompressed
end

# p uncompress('a2b4c1') == 'aabbbbc'
# p uncompress('b1o2t1') == 'boot'
# p uncompress('x3y1x2z4') == 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select { |el| prcs.all? { |prc| prc.call(el) } }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) == [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) == [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) == [7]

def convert_word(word)
    vowels = 'AEIOUaeiou'.split('')
    return word + 'yay' if vowels.include?(word[0])
    word.each_char.with_index do |char, i|
        return word[i..-1] + word[0...i] + 'ay' if vowels.include?(char)
    end
end

def convert_pig_latin(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word.length > 2 ? convert_word(word) : word
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

# p convert_pig_latin('We like to eat bananas') == "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') == "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') == "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') == "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') == "Ouryay amilyfay ewflay to Ancefray"

def translate_word(word)
    vowels = 'AEIOUaeiou'
    return word + word if vowels.include?(word[-1])
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i -= 1
    end
end

def reverberate(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word.length > 2 ? translate_word(word) : word
        new_word = word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') == "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    arr.select { |el| prcs.any? { |prc| prc.call(el) } }
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) == ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) == ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) == ["ace", "dog", "apple", "teeming", "boot"]

def remove_first_vowel(word)
    vowels = 'AEIOUaeiou'
    word.each_char.with_index do |char, i|
        return word[0...i] + word[i + 1..-1] if vowels.include?(char)
    end
    word
end

def remove_last_vowel(word)
    remove_first_vowel(word.reverse).reverse
end

def alternating_vowel(sentence)
    words = sentence.split(' ')
    new_words = words.map.with_index do |char, i|
        i.even? ? remove_first_vowel(word) : remove_last_vowel(word)
    end
    new_words.join(' ')
end

# p alternating_vowel('panthers are great animals') == "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') == "rnning panthrs re epc"
# p alternating_vowel('code properly please') == "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') == "my forecst prdicts ran tday"

def transcribe_word(word)
    vowels = 'AEIOUaeiou'.split('')
    return word + word[-1] if vowels.include?(word[-1])
    new_word = ''
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + 'b' + char
        else
            new_word += char
        end
    end
    new_word
end

def silly_talk(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = transcribe_word(word)
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

# p silly_talk('Kids like cats and dogs') == "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') == "Stobop thabat scobooboteber"
# p silly_talk('They can code') == "Thebey caban codee"
# p silly_talk('He flew to Italy') == "Hee flebew too Ibitabaly"

def compress(str)
    compressed = ''

    i = 0
    while i < str.length
        char = str[i]
        count = 1
        i += 1
        while char == str[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end

# p compress('aabbbbc') == "a2b4c"
# p compress('boot') == "bo2t"
# p compress('xxxyxxzzzz') == "x3yx2z4"