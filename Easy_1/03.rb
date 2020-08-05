=begin
inputs: array
ouput: array
rules:
- input will be sorted array of integers
- ouput will be all missing integers (in order) between
    first and last elements of input

examples:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

algorithm:
- set result to empty array
- set starting_num to first element of input
- set ending_num to last element of input
- iterate over numbers from starting_num to ending_num:
  - if input does not include current num, push it to result
- return result
=end

def missing(arr)
  result = []
  starting_num = arr.first
  ending_num = arr.last

  (starting_num...ending_num).each do |num|
    result << num unless arr.include?(num)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
