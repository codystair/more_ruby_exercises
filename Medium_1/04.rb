=begin
input: array and block
output: array?
rules:
- yields contents of array to block
- block should assign block variables in this way:
  - ignores first two elements
  - groups all remaining elements to a raptors array

algorithm:
- 
=end

birds = %w(raven finch hawk eagle)

def types(arr)
  yield(arr)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
