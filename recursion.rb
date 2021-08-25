def range(start_num, end_num)
    return [] if end_num < start_num
    arr = []
    return [start_num] if start_num == end_num - 1
    arr = [start_num] + range(start_num + 1, end_num)
    arr
end

def sum_arr(arr)
    sum = 0
    arr.each {|ele| sum += ele}
    sum
   
end
# p sum_arr([1, 2, 3])
def sum_arr_re(arr)
  return arr.first if arr.length == 1
  return 0 if arr.length == 0
  arr.shift + sum_arr_re(arr)
end
# p sum_arr_re([1, 2, 3])
# p sum_arr_re([1, 2, 3, 9, 0])
# p sum_arr_re([])

#exponentiation
#v1
def exp_1(base, exp)
    return 1 if exp == 0
    base * exp_1(base, exp - 1)
end
# p exp_1(2, 3)
#v2
def exp_2(base, exp)
    return 1 if exp == 0
    return base if exp == 1
    if exp.even?
        exp_2(base, exp / 2) ** 2 
    else
       base * (exp_2(base, (exp - 1) / 2) ** 2) 
    end
end
p exp_2(2,8)
p exp_2(2,7)
#deep dup
