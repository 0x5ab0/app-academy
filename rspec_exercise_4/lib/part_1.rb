def my_reject(arr, &prc)
    arr.select do |el|
        !prc.call(el)
    end
end

def my_one?(arr, &prc)
    count = arr.count do |el|
        prc.call(el)
    end

    count == 1
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |key, value|
        new_hash[key] = value if prc.call(key, value)
    end

    new_hash
end

def xor_select(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |el|
        if (prc_1.call(el) || prc_2.call(el)) && !(prc_1.call(el) && prc_2.call(el))
            new_arr << el
        end
    end

    new_arr
end

def proc_count(val, arr)
    arr.count do |prc|
        prc.call(val)
    end
end