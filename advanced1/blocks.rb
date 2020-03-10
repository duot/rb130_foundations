# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

<<G1
proc is an obj of Proc class
can be invoked with .call
it can take parameters
if non provided, nil is inserted
G1

puts
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call #>raises eror
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

<<G2
lambdas are not instances of Lambda
lambdas are Proc
  but .to_s indicates lambda
->(){} is the lambda literal
lambdas takes strict parameters,
  raises ArgumentError when args dont match
G2

puts
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal') #> localjumperror

<<G3
method expects a block when it yields
  otherwise, raises LocalJumpError
method can pass any or no args to it's block argument
the bloc argument is a normal proc, and does not raise ArgumentError
G3

puts
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."} #> NameError

<<G4
the block argument has it's own scope.
  it will not have local variables available on method unless passed
method can yield any number of args
  block argument can take any number of arguments
    extra are ignored, ommited ones are nil
    the parameters are filled left to right
G4
