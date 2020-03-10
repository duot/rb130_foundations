


def factorial n
  enum = (1..n).each
  enum.reduce &:*
end

def factorial(n)
  return 0 if n.zero?
  (1..n).reduce &:*
end

alias f factorial

factorial_enumerator = Enumerator.new do |yielder|
  n = 1
  loop do
    yielder << factorial(n)
    n += 1
  end
end

fac = factorial_enumerator
p f 7
10.times { p fac.next }

fac.rewind

fac.take(7).each { |v| p v }


factorial_enum = Enumerator.new do |yielder|
  n = 1
  past_n = 1
  loop do
    past_n *= n
    yielder << past_n
    n += 1
  end
end

10.times { p factorial_enum.next }
factorial_enum.take(10).each { |n| p n }


factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end

p factorial.rewind.next
