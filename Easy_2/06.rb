=begin
input: array and block
output: original array
rules:
- works like Enumberable#each_with_index
- should yield each element and its index to block
- returns reference to original array

example:
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

algorithm:
- set i to 0
- iterate over arr:
  - pass element and i to block
  - increment i by 1
- return arr
=end

def each_with_index(arr)
  i = 0
  arr.each do |item|
    yield(item, i)
    i += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
