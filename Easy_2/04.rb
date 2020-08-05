=begin
input: 0+ arguments and block
output: integer
rules:
- arguments form elements in a collection
- returns number of elements for which block returns true
- returns 0 if argument list is empty

examples:
count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3

algorithm:
- collect arguments into array called arr
- set counter to 0
- increment over arr:
  - increment counter if block returns true for element
- return counter
=end

def count(*args)
  counter = 0
  args.each { |item| counter += 1 if yield(item) }
  counter
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
