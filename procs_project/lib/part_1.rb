def my_map(arr, &block)
    new_array = []
    arr.each { |el| new_array << block.call(el) }
    new_array
end

def my_select(arr, &block)
    new_array = []
    arr.each { |el| new_array << el if block.call(el) }
    new_array
end

def my_count(arr, &block)
    count = 0
    arr.each { |el| count += 1 if block.call(el) }
    count
end

def my_any?(arr, &block)
    arr.each { |el| return true if block.call(el) }
    false
end

def my_all?(arr, &block)
    arr.each { |el| return false if !block.call(el) }
    true
end

def my_none?(arr, &block)
    arr.each { |el| return false if block.call(el) }
    true
end