def element_count(arr)
    count = Hash.new(0)

    arr.each do |el|
        count[el] += 1
    end

    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        str[i] = hash[char] if hash.has_key?(char)
    end

    str
end

def product_inject(arr)
    arr.inject do |product, num|
        product * num
    end
end