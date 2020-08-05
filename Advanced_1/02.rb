# # Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc              #<Proc:0x00007fe706194430@02.rb:2>
puts my_proc.class        # Proc
my_proc.call              # "This is a ."   (can be called without argument)
my_proc.call('cat')       # "This is a cat."

# # Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda            #<Proc:0x00007ffa8790b378@02.rb:12 (lambda)>
puts my_second_lambda     #<Proc:0x00007ffa8790b350@02.rb:13 (lambda)>
puts my_lambda.class      # Proc
my_lambda.call('dog')     # "This is a dog."
my_lambda.call            # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
                          # ^^^^^ NameError (uninitialized constant Lambda)

# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # "This is a ."
block_method_1('seal')   # LocalJumpError "no block given (yield)"

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."    # This is a turtle and a .
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError "undefined local variable or method 'animal'"

=begin
Group 1: simple proc objects
- Seems to be the most flexible.
- Can be called without arguments.
- If called without arguments, block variable is nil.

Group 2: lambdas
- A lambda seems to be a type of proc object.
- Can be created with either 'lambda' keyword or '->'.
- More rigid arity.
- Raises ArgumentError if called without argument.
- No Lambda class.

Group 3: blocks without arguments
- Doesn't need argument.  Uses nil as value of block argument.
- Raises LocalJumpError if no block given and yield used.

Group 4: blocks with arguments
- Similar to Group 3.
- If an additional block argument is declared, uses nil if no argument in yield.
- Obeys local variable scoping rules.

Final Analysis:
- Lambdas are types of Proc's.  Both are Proc objects.  An implicit block
    is a grouping of code, a type of closure, it is not an Object.
- Lambdas enforce the number of arguments passed to them.  Implicit blocks
    and Procs do not enforce the number of arguments passed in.
=end
