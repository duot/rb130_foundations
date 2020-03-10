require 'benchmark'
require 'pry'

def each_cons coll, cons, &block
  return unless coll[cons - 1]

  split = coll.take cons
  yield *split
  each_cons coll[1..-1], cons, &block
end
# 14.285801   0.000005  14.285806 ( 14.287401)

def each_cons coll, cons, &block
  0.upto(coll.size - (cons + 1)) do |i|
    splits = coll[i...i + cons]
    yield *splits
  end
end
# 37.092711   0.071813  37.164524 ( 37.166166)

def each_cons coll, cons, &block
  coll.each_with_index do |elem, i|
    break if i + cons > coll.size
    splits = coll[i...i + cons]
    yield *splits
  end
end
# 15.399472   0.000214  15.399686 ( 15.398849)

def each_cons coll, cons, &block
  coll.each_with_index do |elem, i|
    break if i + cons > coll.size
    yield *coll[i...i + cons]
  end
end
# 15.308195   0.000180  15.308375 ( 15.307906)

def ref_each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end
# 14.555048   0.000024  14.555072 ( 14.558540)

def each_cons coll, cons, &block
  return unless coll[cons - 1]

  yield *coll[0...cons]
  each_cons coll[1..-1], cons, &block
end
# 19.120591   0.000000  19.120591 ( 19.120361)

def each_cons coll, cons, &block
  return unless coll[cons - 1]

  yield *(coll.take cons)
  each_cons coll[1..-1], cons, &block
end
# 13.534995   0.003969  13.538964 ( 13.538921)

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}


hash = {}
arr = (1..1000).to_a
puts Benchmark.measure {
  50_000.times do
    each_cons(arr, 2) { |a, b|
      hash[a] = b
    }
  end
}
