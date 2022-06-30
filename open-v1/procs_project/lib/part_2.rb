def reverser(str, &block)
    block.call(str.reverse)
end

def word_changer(sentence, &block)
    new_sentence = []
    sentence.split(' ').each { |word| new_sentence << block.call(word) }
    new_sentence.join(' ')
end

def greater_proc_value(num, proc_1, proc_2)
    if proc_1.call(num) > proc_2.call(num)
        proc_1.call(num)
    else
        proc_2.call(num)
    end
end

def and_selector(arr, proc_1, proc_2)
    new_array = []
    arr.each { |el| new_array << el if proc_1.call(el) && proc_2.call(el) }
    new_array
end

def alternating_mapper(arr, proc_1, proc_2)
    new_array = []
    arr.each_with_index do |el, i|
        if i.even?
            new_array << proc_1.call(el)
        else
            new_array << proc_2.call(el)
        end
    end
    new_array
end