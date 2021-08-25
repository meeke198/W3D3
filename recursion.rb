def range(start_num, end_num)
    return [] if end_num < start_num
    arr = []
    return [start_num] if start_num == end_num - 1
    arr = [start_num] + range(start_num + 1, end_num)
    arr
end

def sum_arr(arr)
    
end

#exponentiation
#v1

#v2

#deep dup
