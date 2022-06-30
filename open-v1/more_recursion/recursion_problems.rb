#Problem 1: 

def sum_recur(array)
    return array.first if array.length <= 1
    array.first + sum_recur(array[1..-1])
end

#Problem 2: 

def includes?(array, target)
    return false if array.empty?
    array.first == target ? true : includes?(array[1..-1], target)
end

# Problem 3: 

def num_occur(array, target)
    return 0 if array.empty?
    array.first == target ? 1 + num_occur(array[1..-1], target) : num_occur(array[1..-1], target)
end

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length <= 1
    array[0] + array[1] == 12 ? true : add_to_twelve?(array[1..-1])
end

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1
    array[0] < array[1] ? sorted?(array[1..-1]) : false
end

# Problem 6: 

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end