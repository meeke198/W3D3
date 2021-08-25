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
# p exp_2(2,8)
# p exp_2(2,7)

#deep dup
class Array
    def deep_dup
        self.map do |ele| 
            if ele.is_a?(Array)
                ele.deep_dup
            else
                ele
            end
        end
        # copy = []
        # self.each do |ele|
        #     if ele.is_a?(Array)
        #         copy << ele.deep_dup
        #     else
        #         copy << ele
        #     end
        # end
        # copy
    end
end
#org = out arr with different id, but inner arr is the same 
#cpy = out arr with different id 

# a = [1,2,[3,4]]
# a_copy = a.deep_dup
# p a
# a_copy[2] << 9
# p a
# p a_copy


# arr = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# p arr
# a_copy = arr.dup
# # p arr.object_id
# # p arr[0].object_id
# # p arr[1].object_id
# # p "_____"
# # p a_copy.object_id
# # p a_copy[0].object_id
# # p a_copy[1].object_id
# # p "________"
# a_copy[1] << "LEDs"
# # p "________"
# # p arr.object_id
# # p arr[0].object_id
# # p arr[1].object_id
# # p "_____"
# # p a_copy.object_id
# # p a_copy[0].object_id
# # p a_copy[1].object_id
# p arr
# p a_copy

def fib(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    prev = fib(n - 1)
    prev << prev[-2] + prev[-1]
end
# p fib(5)

def bsearch(arr, target)
    return nil if arr.empty?

    pivot = arr.length / 2
    if (target <=> arr[pivot]) == -1
        bsearch(arr.take(pivot), target)
    elsif (target <=> arr[pivot]) == 0
        return pivot
    else
        second_search = bsearch(arr.drop(pivot + 1), target)
        if second_search.nil?
            return nil
        else
            second_search + (pivot + 1)
        end
    end
    
end
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil