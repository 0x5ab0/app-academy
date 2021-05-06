def palindrome?(str)
    rev_str = ''

    i = str.length - 1
    while i >= 0
        rev_str += str[i]

        i -= 1
    end

    str == rev_str
end

def substrings(str)
    subs = []

    str.each_char.with_index do |char1, i|
        str.each_char.with_index do |char2, j|
            subs << str[i..j] if i <= j
        end
    end

    return subs
end

def palindrome_substrings(str)
    subs = substrings(str)

    subs.select { |sub| palindrome?(sub) && sub.length > 1 }
end