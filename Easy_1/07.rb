=begin
input: array
output: boolean
rules:
- works like Enumerable#all?
- returns true if block returns true for all elements passed in
- stops searching once a false is returned by block
- empty array should return true regardless of block

examples:
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true

algorithm:
- possilby return true if array is empty
- iterate through array:
  - return false if block returns false when element is passed in
- return true
=end

def all?(arr)
  arr.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
