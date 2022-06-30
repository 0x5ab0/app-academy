def average(num_1, num_2)
    (num_1 + num_2)/2.0
end

def average_array(arr)
    arr.inject { |sum, el| sum + el } / arr.length.to_f
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase! + '!'
end

def alternating_case(sentence)
    words = sentence.split(' ')

    words.each_with_index do |word, i|
        if i % 2 == 0
            word.upcase!
        else
            word.downcase!
        end
    end

    words.join(' ')
end