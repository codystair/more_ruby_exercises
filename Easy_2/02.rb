=begin
input: 2 arrays
output: nested array
rules:
- works like Array#zip
- each element in output is 2 element array with corespoinding elements
    from input arrays
- returns new array
- assume inputs have same number of elements

example:
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

rules:
- set result to empty array
- iterate over first arr1 with index:
  - push array over current element and element at same index of
      arr2 to result
- return result
=end

def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |item, i|
    result << [item, arr2[i]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
