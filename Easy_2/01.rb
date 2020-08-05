=begin
input: 3 integers
output: ???
rules:
- works like Range#step method
- iterates over range by n increments

algorithm:
- set counter to starting
- while counter < ending:
  - call block passing in counter
  - increment counter by n
- return something
=end

def step(starting, ending, n)
  counter = starting
  while counter <= ending
    yield(counter)
    counter += n
  end
  (starting..ending)
end

step(1, 10, 3) { |value| puts "value = #{value}"}
