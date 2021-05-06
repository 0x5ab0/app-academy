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

def caesar_cipher(message, offset)
    alphabet = ('a'..'z').to_a
    new_message = ''

    message.each_char do |char|
        if alphabet.include?(char)
            current_index = alphabet.index(char)
            new_index = (current_index + offset) % alphabet.length
    
            new_message += alphabet[new_index]
        else
            new_message += char
        end
    end

    new_message
end