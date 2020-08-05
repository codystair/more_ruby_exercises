=begin
input: integer
output: array
rules:
- input will be a positive integer
- output array will contain integers
- integers in output will be all divisors of input
  - a divisor is a number that integer is evenly dividible by

examples:
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

algorithm:
- set result to empty array
- iterate over numbers upto and including input:
  - if input % num == 0, push num to result
- return result
=end

def divisors(n)
  result = []
  1.upto(n) do |num|
    result << num if n % num == 0
  end
  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
