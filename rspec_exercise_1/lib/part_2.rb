def hipsterfy(word)
    vowels = 'aeiou'

    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[(i + 1)..-1]
        end

        i -= 1
    end

    word
end

def vowel_counts(str)
    vowel_count = Hash.new(0)
    vowels = 'aeiou'
    
    str.each_char do |char|
        vowel_count[char.downcase] += 1 if vowels.include?(char.downcase)
    end

    vowel_count
end

def caesar_cipher(message, num)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    new_message = ''

    message.each_char.each_with_index do |char, i|
        if alphabet.include?(char)
            current_index = alphabet.index(char)
            offset = (current_index + num) % alphabet.length
    
            new_message += alphabet[offset]
        else
            new_message += char
        end
    end

    new_message
end