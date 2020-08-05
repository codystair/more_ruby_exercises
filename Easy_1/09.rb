=begin
input: array
output: boolean
rules:
- works like Enumerable#one?
- returns true if block returns true for EXACTLY one element
- stops searching the second time the block returns true
- returns false when array is empty regardless of block

examples:
one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false

algorithm:
- possibly return false if array is empty
- set counter to 0
- iterate over array:
  - increment counter if block returns true for element
  - return false if counter > 1
- if counter > 0 return true, otherwise return false
=end

def one?(arr)
  counter = 0
  arr.each do |el|
    counter += 1 if yield(el)
    return false if counter > 1
  end
  counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
