=begin
input: array and block
output: array
rules:
- works like Enumerable#drop_while
- drop_while iterates over a collection until block returns false for
    an element or nil
- then in converts the remaining elements to an array and returns it
- returns elements in array except those that return true when
    passed into a block
- returns empty array if input is empty
- returns empty array if block returns true for all elements

examples:
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []

algorithm:
- set result to empty array
- set switch to false
- iterate over array:
  - if block returns false, set switch to true

- return result
=end

def drop_while(arr)
  result = []
  switch = false
  arr.each do |item|
    switch = true unless yield(item)
    result << item if switch
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
