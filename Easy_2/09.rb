=begin
input: array and block
output: nil

rules:
- works like Enumerable#each_cons
- takes 2 elements at a time and yields them to block

examples:
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil

algorithm:
- set start_point to 0
- set end_point to 1
- while end_point < size of array:
  - yield array at start_point and array at end_point to block
  - increment start_point by 1
  - increment end_point by 1
- return nil
=end

def each_cons(arr)
  start_point = 0
  end_point = 1
  while end_point < arr.size
    yield(arr[start_point], arr[end_point])
    start_point += 1
    end_point += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
