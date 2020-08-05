=begin
input: takes optional block
ouput: returns value of block if executed, string if not

rules:
- calling with block is optional
- if block is included, it should execute it and return its value
- if block is not included, return "Does not compute."

examples:
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

algorithm:
- if block is given:
  - return value of block
- otherwise:
  - return "Does no compute."
=end

# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further Exploration:

def compute(arg)
  block_given? ? yield(arg) : arg
end

p compute(5) { |num| num + num } == 10
p compute('hello') { |str| str + ' ' + 'world' } == 'hello world'
p compute('hello') == 'hello'
